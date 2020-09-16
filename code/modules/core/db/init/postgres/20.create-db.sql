-- begin SIMIDATA_TABLE_FIELD
alter table SIMIDATA_TABLE_FIELD add constraint FK_SIMIDATA_TABLE_FIELD_ON_POSTGRES_TABLE foreign key (POSTGRES_TABLE_ID) references SIMIDATA_POSTGRES_TABLE(ID)^
create unique index IDX_SIMIDATA_TABLE_FIELD_UNQ_NAME_POSTGRES_TABLE_ID on SIMIDATA_TABLE_FIELD (NAME, POSTGRES_TABLE_ID) where DELETE_TS is null ^
create index IDX_SIMIDATA_TABLE_FIELD_ON_POSTGRES_TABLE on SIMIDATA_TABLE_FIELD (POSTGRES_TABLE_ID)^
-- end SIMIDATA_TABLE_FIELD
-- begin SIMIIAM_ROLE
create unique index IDX_SIMIIAM_ROLE_UK_NAME on SIMIIAM_ROLE (NAME) where DELETE_TS is null ^
-- end SIMIIAM_ROLE
-- begin FI_LAYER_RELATION
alter table FI_LAYER_RELATION add constraint FK_FI_LAYER_RELATION_ON_DATA_SET_VIEW foreign key (DATA_SET_VIEW_ID) references PRODUCT_DATA_SET_VIEW(ID)^
alter table FI_LAYER_RELATION add constraint FK_FI_LAYER_RELATION_ON_FEATURE_INFO foreign key (FEATURE_INFO_ID) references FI_FEATURE_INFO(ID)^
create index IDX_FI_LAYER_RELATION_ON_DATA_SET_VIEW on FI_LAYER_RELATION (DATA_SET_VIEW_ID)^
create index IDX_FI_LAYER_RELATION_ON_FEATURE_INFO on FI_LAYER_RELATION (FEATURE_INFO_ID)^
-- end FI_LAYER_RELATION
-- begin SIMIPRODUCT_DATA_PRODUCT
alter table SIMIPRODUCT_DATA_PRODUCT add constraint FK_SIMIPRODUCT_DATA_PRODUCT_ON_PUB_SCOPE foreign key (PUB_SCOPE_ID) references SIMIPRODUCT_DATA_PRODUCT_PUB_SCOPE(ID)^
create unique index IDX_SIMIPRODUCT_DATA_PRODUCT_UK_IDENTIFIER on SIMIPRODUCT_DATA_PRODUCT (IDENTIFIER) where DELETE_TS is null ^
create index IDX_SIMIPRODUCT_DATA_PRODUCT_ON_PUB_SCOPE on SIMIPRODUCT_DATA_PRODUCT (PUB_SCOPE_ID)^
-- end SIMIPRODUCT_DATA_PRODUCT
-- begin SIMIDATA_POSTGRES_DB
create unique index IDX_SIMIDATA_POSTGRES_DB_UK_DB_NAME on SIMIDATA_POSTGRES_DB (DB_NAME) where DELETE_TS is null ^
-- end SIMIDATA_POSTGRES_DB
-- begin SIMIDATA_MODEL_SCHEMA
alter table SIMIDATA_MODEL_SCHEMA add constraint FK_SIMIDATA_MODEL_SCHEMA_ON_POSTGRES_DB foreign key (POSTGRES_DB_ID) references SIMIDATA_POSTGRES_DB(ID)^
create unique index IDX_SIMIDATA_MODEL_SCHEMA_UNQ_SCHEMA_NAME_POSTGRES_DB_ID on SIMIDATA_MODEL_SCHEMA (SCHEMA_NAME, POSTGRES_DB_ID) where DELETE_TS is null ^
create index IDX_SIMIDATA_MODEL_SCHEMA_ON_POSTGRES_DB on SIMIDATA_MODEL_SCHEMA (POSTGRES_DB_ID)^
-- end SIMIDATA_MODEL_SCHEMA
-- begin PRODUCT_DATA_SET_VIEW
alter table PRODUCT_DATA_SET_VIEW add constraint FK_PRODUCT_DATA_SET_VIEW_ON_FEATURE_INFO foreign key (FEATURE_INFO_ID) references FI_FEATURE_INFO(ID)^
create index IDX_PRODUCT_DATA_SET_VIEW_ON_FEATURE_INFO on PRODUCT_DATA_SET_VIEW (FEATURE_INFO_ID)^
-- end PRODUCT_DATA_SET_VIEW
-- begin SIMIIAM_IDENTITY
create unique index IDX_SIMIIAM_IDENTITY_UK_IDENTIFIER on SIMIIAM_IDENTITY (IDENTIFIER) where DELETE_TS is null ^
-- end SIMIIAM_IDENTITY
-- begin SIMIDATA_VIEW_FIELD
alter table SIMIDATA_VIEW_FIELD add constraint FK_SIMIDATA_VIEW_FIELD_ON_TABLE_FIELD foreign key (TABLE_FIELD_ID) references SIMIDATA_TABLE_FIELD(ID)^
alter table SIMIDATA_VIEW_FIELD add constraint FK_SIMIDATA_VIEW_FIELD_ON_TABLE_VIEW foreign key (TABLE_VIEW_ID) references SIMIDATA_TABLE_VIEW(ID)^
create unique index IDX_SIMI_VIEW_FIELD_UNQ_TABLE_FIELD_ID_TABLE_VIEW_ID on SIMIDATA_VIEW_FIELD (TABLE_FIELD_ID, TABLE_VIEW_ID) where DELETE_TS is null ^
create index IDX_SIMIDATA_VIEW_FIELD_ON_TABLE_FIELD on SIMIDATA_VIEW_FIELD (TABLE_FIELD_ID)^
create index IDX_SIMIDATA_VIEW_FIELD_ON_TABLE_VIEW on SIMIDATA_VIEW_FIELD (TABLE_VIEW_ID)^
-- end SIMIDATA_VIEW_FIELD
-- begin SIMIPRODUCT_PROPERTIES_IN_LIST
alter table SIMIPRODUCT_PROPERTIES_IN_LIST add constraint FK_SIMIPRODUCT_PROPERTIES_IN_LIST_ON_PRODUCT_LIST foreign key (PRODUCT_LIST_ID) references SIMIPRODUCT_PRODUCT_LIST(ID)^
alter table SIMIPRODUCT_PROPERTIES_IN_LIST add constraint FK_SIMIPRODUCT_PROPERTIES_IN_LIST_ON_SINGLE_ACTOR foreign key (SINGLE_ACTOR_ID) references SIMIPRODUCT_SINGLE_ACTOR(ID)^
create unique index IDX_SIMI_PROPERTIES_IN_LIST_UNQ_PRODUCT_LIST_ID_SINGLE_ACTOR_ID on SIMIPRODUCT_PROPERTIES_IN_LIST (PRODUCT_LIST_ID, SINGLE_ACTOR_ID) where DELETE_TS is null ^
create index IDX_SIMIPRODUCT_PROPERTIES_IN_LIST_ON_PRODUCT_LIST on SIMIPRODUCT_PROPERTIES_IN_LIST (PRODUCT_LIST_ID)^
create index IDX_SIMIPRODUCT_PROPERTIES_IN_LIST_ON_SINGLE_ACTOR on SIMIPRODUCT_PROPERTIES_IN_LIST (SINGLE_ACTOR_ID)^
-- end SIMIPRODUCT_PROPERTIES_IN_LIST
-- begin SIMIPRODUCT_PROPERTIES_IN_FACADE
alter table SIMIPRODUCT_PROPERTIES_IN_FACADE add constraint FK_SIMIPRODUCT_PROPERTIES_IN_FACADE_ON_DATA_SET_VIEW foreign key (DATA_SET_VIEW_ID) references SIMIPRODUCT_DATA_SET_VIEW(ID)^
alter table SIMIPRODUCT_PROPERTIES_IN_FACADE add constraint FK_SIMIPRODUCT_PROPERTIES_IN_FACADE_ON_FACADE_LAYER foreign key (FACADE_LAYER_ID) references SIMIPRODUCT_FACADE_LAYER(ID)^
create unique index IDX_SIMIPRODUCT_PROPERTIES_IN_FACADE_UNQ_DATA_SET_VIEW_ID_FACADE_LAYER_ID on SIMIPRODUCT_PROPERTIES_IN_FACADE (DATA_SET_VIEW_ID, FACADE_LAYER_ID) where DELETE_TS is null ^
create index IDX_SIMIPRODUCT_PROPERTIES_IN_FACADE_ON_DATA_SET_VIEW on SIMIPRODUCT_PROPERTIES_IN_FACADE (DATA_SET_VIEW_ID)^
create index IDX_SIMIPRODUCT_PROPERTIES_IN_FACADE_ON_FACADE_LAYER on SIMIPRODUCT_PROPERTIES_IN_FACADE (FACADE_LAYER_ID)^
-- end SIMIPRODUCT_PROPERTIES_IN_FACADE
-- begin SIMIDATA_EXTERNAL_TABLE
alter table SIMIDATA_EXTERNAL_TABLE add constraint FK_SIMIDATA_EXTERNAL_TABLE_ON_ID foreign key (ID) references SIMIDATA_TABLE_DS(ID) on delete CASCADE^
-- end SIMIDATA_EXTERNAL_TABLE
-- begin SIMIDATA_POSTGRES_TABLE
alter table SIMIDATA_POSTGRES_TABLE add constraint FK_SIMIDATA_POSTGRES_TABLE_ON_MODEL_SCHEMA foreign key (MODEL_SCHEMA_ID) references SIMIDATA_MODEL_SCHEMA(ID)^
alter table SIMIDATA_POSTGRES_TABLE add constraint FK_SIMIDATA_POSTGRES_TABLE_ON_ID foreign key (ID) references SIMIDATA_TABLE_DS(ID) on delete CASCADE^
create index IDX_SIMIDATA_POSTGRES_TABLE_ON_MODEL_SCHEMA on SIMIDATA_POSTGRES_TABLE (MODEL_SCHEMA_ID)^
-- end SIMIDATA_POSTGRES_TABLE
-- begin SIMIPRODUCT_SINGLE_ACTOR
alter table SIMIPRODUCT_SINGLE_ACTOR add constraint FK_SIMIPRODUCT_SINGLE_ACTOR_ON_ID foreign key (ID) references SIMIPRODUCT_DATA_PRODUCT(ID) on delete CASCADE^
-- end SIMIPRODUCT_SINGLE_ACTOR
-- begin SIMIPRODUCT_PRODUCT_LIST
alter table SIMIPRODUCT_PRODUCT_LIST add constraint FK_SIMIPRODUCT_PRODUCT_LIST_ON_ID foreign key (ID) references SIMIPRODUCT_DATA_PRODUCT(ID) on delete CASCADE^
-- end SIMIPRODUCT_PRODUCT_LIST
-- begin SIMIIAM_USER
alter table SIMIIAM_USER add constraint FK_SIMIIAM_USER_ON_ID foreign key (ID) references SIMIIAM_IDENTITY(ID) on delete CASCADE^
-- end SIMIIAM_USER
-- begin SIMIIAM_GROUP
alter table SIMIIAM_GROUP add constraint FK_SIMIIAM_GROUP_ON_ID foreign key (ID) references SIMIIAM_IDENTITY(ID) on delete CASCADE^
-- end SIMIIAM_GROUP
-- begin SIMIPRODUCT_FACADE_LAYER
alter table SIMIPRODUCT_FACADE_LAYER add constraint FK_SIMIPRODUCT_FACADE_LAYER_ON_ID foreign key (ID) references SIMIPRODUCT_SINGLE_ACTOR(ID) on delete CASCADE^
-- end SIMIPRODUCT_FACADE_LAYER
-- begin SIMIPRODUCT_DATA_SET_VIEW
alter table SIMIPRODUCT_DATA_SET_VIEW add constraint FK_SIMIPRODUCT_DATA_SET_VIEW_ON_ID foreign key (ID) references SIMIPRODUCT_SINGLE_ACTOR(ID) on delete CASCADE^
-- end SIMIPRODUCT_DATA_SET_VIEW
-- begin SIMIPRODUCT_LAYER_GROUP
alter table SIMIPRODUCT_LAYER_GROUP add constraint FK_SIMIPRODUCT_LAYER_GROUP_ON_ID foreign key (ID) references SIMIPRODUCT_PRODUCT_LIST(ID) on delete CASCADE^
-- end SIMIPRODUCT_LAYER_GROUP
-- begin SIMIPRODUCT_MAP
alter table SIMIPRODUCT_MAP add constraint FK_SIMIPRODUCT_MAP_ON_ID foreign key (ID) references SIMIPRODUCT_PRODUCT_LIST(ID) on delete CASCADE^
-- end SIMIPRODUCT_MAP
-- begin SIMIDATA_RASTER_VIEW
alter table SIMIDATA_RASTER_VIEW add constraint FK_SIMIDATA_RASTER_VIEW_ON_RASTER_DS foreign key (RASTER_DS_ID) references SIMIDATA_RASTER_DS(ID)^
alter table SIMIDATA_RASTER_VIEW add constraint FK_SIMIDATA_RASTER_VIEW_ON_ID foreign key (ID) references SIMIPRODUCT_DATA_SET_VIEW(ID) on delete CASCADE^
create index IDX_SIMIDATA_RASTER_VIEW_ON_RASTER_DS on SIMIDATA_RASTER_VIEW (RASTER_DS_ID)^
-- end SIMIDATA_RASTER_VIEW
-- begin SIMIDATA_TABLE_VIEW
alter table SIMIDATA_TABLE_VIEW add constraint FK_SIMIDATA_TABLE_VIEW_ON_POSTGRES_TABLE foreign key (POSTGRES_TABLE_ID) references SIMIDATA_POSTGRES_TABLE(ID)^
alter table SIMIDATA_TABLE_VIEW add constraint FK_SIMIDATA_TABLE_VIEW_ON_ID foreign key (ID) references SIMIPRODUCT_DATA_SET_VIEW(ID) on delete CASCADE^
create index IDX_SIMIDATA_TABLE_VIEW_ON_POSTGRES_TABLE on SIMIDATA_TABLE_VIEW (POSTGRES_TABLE_ID)^
-- end SIMIDATA_TABLE_VIEW
-- begin SIMIIAM_GROUP_USER_LINK
alter table SIMIIAM_GROUP_USER_LINK add constraint FK_SIMGROUSE_ON_GROUP foreign key (GROUP_ID) references SIMIIAM_GROUP(ID)^
alter table SIMIIAM_GROUP_USER_LINK add constraint FK_SIMGROUSE_ON_USER foreign key (USER_ID) references SIMIIAM_USER(ID)^
-- end SIMIIAM_GROUP_USER_LINK
-- begin SIMIIAM_ROLE_GROUP_LINK
alter table SIMIIAM_ROLE_GROUP_LINK add constraint FK_SIMROLGRO_ON_GROUP foreign key (GROUP_ID) references SIMIIAM_GROUP(ID)^
alter table SIMIIAM_ROLE_GROUP_LINK add constraint FK_SIMROLGRO_ON_ROLE foreign key (ROLE_ID) references SIMIIAM_ROLE(ID)^
-- end SIMIIAM_ROLE_GROUP_LINK
-- begin SIMIIAM_ROLE_USER_LINK
alter table SIMIIAM_ROLE_USER_LINK add constraint FK_SIMROLUSE_ON_USER foreign key (USER_ID) references SIMIIAM_USER(ID)^
alter table SIMIIAM_ROLE_USER_LINK add constraint FK_SIMROLUSE_ON_ROLE foreign key (ROLE_ID) references SIMIIAM_ROLE(ID)^
-- end SIMIIAM_ROLE_USER_LINK
-- begin SIMIIAM_PERMISSION
alter table SIMIIAM_PERMISSION add constraint FK_SIMIIAM_PERMISSION_ON_DATA_SET_VIEW foreign key (DATA_SET_VIEW_ID) references SIMIPRODUCT_DATA_SET_VIEW(ID)^
alter table SIMIIAM_PERMISSION add constraint FK_SIMIIAM_PERMISSION_ON_ROLE foreign key (ROLE_ID) references SIMIIAM_ROLE(ID)^
create unique index IDX_SIMI_PERMISSION_UNQ_DATA_SET_VIEW_ID_ROLE_ID on SIMIIAM_PERMISSION (DATA_SET_VIEW_ID, ROLE_ID) where DELETE_TS is null ^
create index IDX_SIMIIAM_PERMISSION_ON_DATA_SET_VIEW on SIMIIAM_PERMISSION (DATA_SET_VIEW_ID)^
create index IDX_SIMIIAM_PERMISSION_ON_ROLE on SIMIIAM_PERMISSION (ROLE_ID)^
-- end SIMIIAM_PERMISSION
-- begin SIMICCC_CCC_CLIENT
alter table SIMICCC_CCC_CLIENT add constraint FK_SIMICCC_CCC_CLIENT_ON_MAP foreign key (MAP_ID) references SIMIPRODUCT_MAP(ID)^
create index IDX_SIMICCC_CCC_CLIENT_ON_MAP on SIMICCC_CCC_CLIENT (MAP_ID)^
-- end SIMICCC_CCC_CLIENT
-- begin SIMICCC_NOTIFY_LAYER
alter table SIMICCC_NOTIFY_LAYER add constraint FK_SIMICCC_NOTIFY_LAYER_ON_CCC_CLIENT foreign key (CCC_CLIENT_ID) references SIMICCC_CCC_CLIENT(ID)^
alter table SIMICCC_NOTIFY_LAYER add constraint FK_SIMICCC_NOTIFY_LAYER_ON_DATA_SET_VIEW foreign key (DATA_SET_VIEW_ID) references SIMIPRODUCT_DATA_SET_VIEW(ID)^
create unique index IDX_SIMI_NOTIFY_LAYER_UNQ_CCC_CLIENT_ID_DATA_SET_VIEW_ID on SIMICCC_NOTIFY_LAYER (CCC_CLIENT_ID, DATA_SET_VIEW_ID) where DELETE_TS is null ^
create index IDX_SIMICCC_NOTIFY_LAYER_ON_CCC_CLIENT on SIMICCC_NOTIFY_LAYER (CCC_CLIENT_ID)^
create index IDX_SIMICCC_NOTIFY_LAYER_ON_DATA_SET_VIEW on SIMICCC_NOTIFY_LAYER (DATA_SET_VIEW_ID)^
-- end SIMICCC_NOTIFY_LAYER
-- begin SIMICCC_LOCATOR_LAYER
alter table SIMICCC_LOCATOR_LAYER add constraint FK_SIMICCC_LOCATOR_LAYER_ON_CCC_CLIENT foreign key (CCC_CLIENT_ID) references SIMICCC_CCC_CLIENT(ID)^
alter table SIMICCC_LOCATOR_LAYER add constraint FK_SIMICCC_LOCATOR_LAYER_ON_DATA_SET_VIEW foreign key (DATA_SET_VIEW_ID) references SIMIPRODUCT_DATA_SET_VIEW(ID)^
create unique index IDX_SIMI_LOCATOR_LAYER_UNQ_CCC_CLIENT_ID_DATA_SET_VIEW_ID_FILTER on SIMICCC_LOCATOR_LAYER (CCC_CLIENT_ID, DATA_SET_VIEW_ID, FILTER_) where DELETE_TS is null ^
create index IDX_SIMICCC_LOCATOR_LAYER_ON_CCC_CLIENT on SIMICCC_LOCATOR_LAYER (CCC_CLIENT_ID)^
create index IDX_SIMICCC_LOCATOR_LAYER_ON_DATA_SET_VIEW on SIMICCC_LOCATOR_LAYER (DATA_SET_VIEW_ID)^
-- end SIMICCC_LOCATOR_LAYER
