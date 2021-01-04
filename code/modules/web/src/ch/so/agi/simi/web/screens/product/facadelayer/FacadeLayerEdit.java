package ch.so.agi.simi.web.screens.product.facadelayer;

import ch.so.agi.simi.entity.product.datasetview.DataSetView;
import ch.so.agi.simi.entity.product.datasetview.StyleAsset;
import ch.so.agi.simi.entity.product.non_dsv.*;
import ch.so.agi.simi.web.SortBean;
import ch.so.agi.simi.web.beans.style.StyleDbContent;
import ch.so.agi.simi.web.beans.style.StyleFileContent;
import ch.so.agi.simi.web.beans.style.StyleStorageBean;
import com.haulmont.cuba.gui.AppConfig;
import com.haulmont.cuba.gui.Notifications;
import com.haulmont.cuba.gui.ScreenBuilders;
import com.haulmont.cuba.gui.components.*;
import com.haulmont.cuba.gui.export.ByteArrayDataProvider;
import com.haulmont.cuba.gui.model.CollectionPropertyContainer;
import com.haulmont.cuba.gui.model.DataContext;
import com.haulmont.cuba.gui.model.InstanceContainer;
import com.haulmont.cuba.gui.screen.*;
import com.haulmont.cuba.gui.util.OperationResult;

import javax.inject.Inject;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;

@UiController("simiProduct_FacadeLayer.edit")
@UiDescriptor("facade-layer-edit.xml")
@EditedEntityContainer("dataProductDc")
@LoadDataBeforeShow
public class FacadeLayerEdit extends StandardEditor<FacadeLayer> {
    @Inject
    private ScreenBuilders screenBuilders;
    @Inject
    private CollectionPropertyContainer<PropertiesInFacade> propertiesInFacadeDc;
    @Inject
    private Table<PropertiesInFacade> propertiesInFacadeTable;
    @Inject
    private DataContext dataContext;
    @Inject
    private SortBean sortBean;

    @Subscribe("btnPifAddDataSetView")
    public void onBtnPifAddDataSetViewClick(Button.ClickEvent event) {
        PropertiesInFacade pif = dataContext.create(PropertiesInFacade.class);
        pif.setFacadeLayer(this.getEditedEntity());

        propertiesInFacadeDc.getMutableItems().add(pif);

        propertiesInFacadeTable.requestFocus(pif, "dataSetView");
    }

    @Subscribe("btnPifSort")
    public void onBtnPifSortClick(Button.ClickEvent event) {
        propertiesInFacadeTable.sort("sort", Table.SortDirection.ASCENDING);
    }

    @Subscribe(target = Target.DATA_CONTEXT)
    public void onPreCommit(DataContext.PreCommitEvent event) {
        List<PropertiesInFacade> entities = sortBean.AdjustSort(propertiesInFacadeDc.getItems());

        //add modified instances to the commit list
        event.getModifiedInstances().addAll(entities);
    }

    @Subscribe("convertToLayerGroup")
    public void onConvertToLayerGroup(Action.ActionPerformedEvent event) {
        // change identifier of old FL to prevent UK constraint error on identifier
        String identifier = this.getEditedEntity().getIdentifier();
        this.getEditedEntity().setIdentifier(identifier + "_toLG");
        try {
            dataContext.commit();
        } catch (Exception e) {
            this.getEditedEntity().setIdentifier(identifier);
            throw e;
        }

        FacadeLayer facadeLayer = this.getEditedEntity();
        dataContext.remove(facadeLayer);

        LayerGroup layerGroup = dataContext.create(LayerGroup.class);
        layerGroup.setIdentifier(identifier);
        layerGroup.setPubScope(facadeLayer.getPubScope());
        layerGroup.setKeywords(facadeLayer.getKeywords());
        layerGroup.setRemarks(facadeLayer.getRemarks());
        layerGroup.setSynonyms(facadeLayer.getSynonyms());
        layerGroup.setTitle(facadeLayer.getTitle());
        layerGroup.setReleasedAt(facadeLayer.getReleasedAt());
        layerGroup.setReleasedThrough(facadeLayer.getReleasedThrough());

        if (facadeLayer.getDataSetViews() != null) {
            for (PropertiesInFacade propertiesInFacade : facadeLayer.getDataSetViews()) {
                PropertiesInList propertiesInList = dataContext.create(PropertiesInList.class);
                dataContext.remove(propertiesInFacade);

                propertiesInList.setSort(propertiesInFacade.getSort());
                propertiesInList.setTransparency(propertiesInFacade.getTransparency());
                propertiesInList.setProductList(layerGroup);
                propertiesInList.setSingleActor(propertiesInFacade.getDataSetView());
            }
        }

        OperationResult result = closeWithCommit();

        if (result == OperationResult.success()) {
            screenBuilders.editor(LayerGroup.class, this)
                    .editEntity(layerGroup)
                    .build()
                    .show();
        } else {
            // change identifier back to original value
            facadeLayer.setIdentifier(identifier);
            dataContext.commit();
        }
    }
}