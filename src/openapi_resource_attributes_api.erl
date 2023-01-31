-module(openapi_resource_attributes_api).

-export([create_resource_attribute/5, create_resource_attribute/6,
         delete_resource_attribute/5, delete_resource_attribute/6,
         get_resource_attribute/5, get_resource_attribute/6,
         list_resource_attributes/4, list_resource_attributes/5,
         update_resource_attribute/6, update_resource_attribute/7]).

-define(BASE_URL, <<"">>).

%% @doc Create Resource Attribute
%% Creates a new attribute as part of the resource definition.
-spec create_resource_attribute(ctx:ctx(), binary(), binary(), binary(), openapi_resource_attribute_create:openapi_resource_attribute_create()) -> {ok, openapi_resource_attribute_read:openapi_resource_attribute_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
create_resource_attribute(Ctx, ProjId, EnvId, ResourceId, OpenapiResourceAttributeCreate) ->
    create_resource_attribute(Ctx, ProjId, EnvId, ResourceId, OpenapiResourceAttributeCreate, #{}).

-spec create_resource_attribute(ctx:ctx(), binary(), binary(), binary(), openapi_resource_attribute_create:openapi_resource_attribute_create(), maps:map()) -> {ok, openapi_resource_attribute_read:openapi_resource_attribute_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
create_resource_attribute(Ctx, ProjId, EnvId, ResourceId, OpenapiResourceAttributeCreate, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = post,
    Path = [<<"/v2/schema/", ProjId, "/", EnvId, "/resources/", ResourceId, "/attributes">>],
    QS = [],
    Headers = [],
    Body1 = OpenapiResourceAttributeCreate,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Delete Resource Attribute
%% Deletes the attribute and all its related data.  Note: If the attribute is used by policies, removing it will cause the attribute to evaluate as `undefined`.
-spec delete_resource_attribute(ctx:ctx(), binary(), binary(), binary(), binary()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
delete_resource_attribute(Ctx, ProjId, EnvId, ResourceId, AttributeId) ->
    delete_resource_attribute(Ctx, ProjId, EnvId, ResourceId, AttributeId, #{}).

-spec delete_resource_attribute(ctx:ctx(), binary(), binary(), binary(), binary(), maps:map()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
delete_resource_attribute(Ctx, ProjId, EnvId, ResourceId, AttributeId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = delete,
    Path = [<<"/v2/schema/", ProjId, "/", EnvId, "/resources/", ResourceId, "/attributes/", AttributeId, "">>],
    QS = lists:flatten([])++openapi_utils:optional_params(['page', 'per_page'], _OptionalParams),
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Get Resource Attribute
%% Gets a single attribute defined on the resource, if such attribute exists.
-spec get_resource_attribute(ctx:ctx(), binary(), binary(), binary(), binary()) -> {ok, openapi_resource_attribute_read:openapi_resource_attribute_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_resource_attribute(Ctx, ProjId, EnvId, ResourceId, AttributeId) ->
    get_resource_attribute(Ctx, ProjId, EnvId, ResourceId, AttributeId, #{}).

-spec get_resource_attribute(ctx:ctx(), binary(), binary(), binary(), binary(), maps:map()) -> {ok, openapi_resource_attribute_read:openapi_resource_attribute_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_resource_attribute(Ctx, ProjId, EnvId, ResourceId, AttributeId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = [<<"/v2/schema/", ProjId, "/", EnvId, "/resources/", ResourceId, "/attributes/", AttributeId, "">>],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc List Resource Attributes
%% Lists all the attributes defined on the resource.
-spec list_resource_attributes(ctx:ctx(), binary(), binary(), binary()) -> {ok, [openapi_resource_attribute_read:openapi_resource_attribute_read()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
list_resource_attributes(Ctx, ProjId, EnvId, ResourceId) ->
    list_resource_attributes(Ctx, ProjId, EnvId, ResourceId, #{}).

-spec list_resource_attributes(ctx:ctx(), binary(), binary(), binary(), maps:map()) -> {ok, [openapi_resource_attribute_read:openapi_resource_attribute_read()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
list_resource_attributes(Ctx, ProjId, EnvId, ResourceId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = [<<"/v2/schema/", ProjId, "/", EnvId, "/resources/", ResourceId, "/attributes">>],
    QS = lists:flatten([])++openapi_utils:optional_params(['page', 'per_page'], _OptionalParams),
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Update Resource Attribute
%% Partially updates the attribute defined on a resource. Fields that will be provided will be completely overwritten.
-spec update_resource_attribute(ctx:ctx(), binary(), binary(), binary(), binary(), openapi_resource_attribute_update:openapi_resource_attribute_update()) -> {ok, openapi_resource_attribute_read:openapi_resource_attribute_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
update_resource_attribute(Ctx, ProjId, EnvId, ResourceId, AttributeId, OpenapiResourceAttributeUpdate) ->
    update_resource_attribute(Ctx, ProjId, EnvId, ResourceId, AttributeId, OpenapiResourceAttributeUpdate, #{}).

-spec update_resource_attribute(ctx:ctx(), binary(), binary(), binary(), binary(), openapi_resource_attribute_update:openapi_resource_attribute_update(), maps:map()) -> {ok, openapi_resource_attribute_read:openapi_resource_attribute_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
update_resource_attribute(Ctx, ProjId, EnvId, ResourceId, AttributeId, OpenapiResourceAttributeUpdate, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = patch,
    Path = [<<"/v2/schema/", ProjId, "/", EnvId, "/resources/", ResourceId, "/attributes/", AttributeId, "">>],
    QS = [],
    Headers = [],
    Body1 = OpenapiResourceAttributeUpdate,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).


