package ch.so.agi.simi.web.screens.product.dataproduct_pubscope;

import com.haulmont.cuba.gui.screen.*;
import ch.so.agi.simi.entity.product.non_dsv.DataProduct_PubScope;

@UiController("simiProduct_DataProduct_PubScope.edit")
@UiDescriptor("data-product_pub-scope-edit.xml")
@EditedEntityContainer("dataProduct_PubScopeDc")
@LoadDataBeforeShow
public class DataProduct_PubScopeEdit extends StandardEditor<DataProduct_PubScope> {
}