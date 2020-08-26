package ch.so.agi.simi.web.screens.product.dataproduct;

import ch.so.agi.simi.entity.product.LayerList;
import ch.so.agi.simi.entity.product.Map;
import ch.so.agi.simi.entity.product.SingleActor;
import com.haulmont.cuba.core.global.Metadata;
import com.haulmont.cuba.gui.ScreenBuilders;
import com.haulmont.cuba.gui.components.Action;
import com.haulmont.cuba.gui.components.GroupTable;
import com.haulmont.cuba.gui.screen.*;
import ch.so.agi.simi.entity.product.DataProduct;

import javax.inject.Inject;

@UiController("simi_DataProduct.browse")
@UiDescriptor("data-product-browse.xml")
@LookupComponent("dataProductsTable")
@LoadDataBeforeShow
public class DataProductBrowse extends StandardLookup<DataProduct> {

    @Inject
    private ScreenBuilders screenBuilders;
    @Inject
    private GroupTable<DataProduct> dataProductsTable;
    @Inject
    private Metadata metadata;

    @Subscribe("createBtn.createMap")
    protected void onCreateBtnCreateMap(Action.ActionPerformedEvent event) {
        Map map = metadata.create(Map.class);
        showCreateEditorForDataProduct(map);
    }

    @Subscribe("createBtn.createLayerList")
    protected void onCreateBtnCreateLayerList(Action.ActionPerformedEvent event) {
        LayerList layerList = metadata.create(LayerList.class);
        showCreateEditorForDataProduct(layerList);
    }

    @Subscribe("createBtn.createSingleActor")
    protected void onCreateBtnCreateSingleActor(Action.ActionPerformedEvent event) {
        SingleActor singleActor = metadata.create(SingleActor.class);
        showCreateEditorForDataProduct(singleActor);
    }

    private void showCreateEditorForDataProduct(DataProduct dataProduct) {
        screenBuilders.editor(dataProductsTable)
                .editEntity(dataProduct)
                .build()
                .show();
    }
}