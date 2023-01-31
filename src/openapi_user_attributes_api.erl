-module(openapi_user_attributes_api).

-export([create_user_attribute/4, create_user_attribute/5,
         delete_user_attribute/4, delete_user_attribute/5,
         get_user_attribute/4, get_user_attribute/5,
         list_user_attributes/3, list_user_attributes/4,
         update_user_attribute/5, update_user_attribute/6]).

-define(BASE_URL, <<"">>).

%% @doc Create User Attribute
%% Creates a new attribute for the User resource.
-spec create_user_attribute(ctx:ctx(), binary(), binary(), openapi_resource_attribute_create:openapi_resource_attribute_create()) -> {ok, openapi_resource_attribute_read:openapi_resource_attribute_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
create_user_attribute(Ctx, ProjId, EnvId, OpenapiResourceAttributeCreate) ->
    create_user_attribute(Ctx, ProjId, EnvId, OpenapiResourceAttributeCreate, #{}).

-spec create_user_attribute(ctx:ctx(), binary(), binary(), openapi_resource_attribute_create:openapi_resource_attribute_create(), maps:map()) -> {ok, openapi_resource_attribute_read:openapi_resource_attribute_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
create_user_attribute(Ctx, ProjId, EnvId, OpenapiResourceAttributeCreate, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = post,
    Path = [<<"/v2/schema/", ProjId, "/", EnvId, "/users/attributes">>],
    QS = lists:flatten([])++openapi_utils:optional_params(['resource_id'], _OptionalParams),
    Headers = [],
    Body1 = OpenapiResourceAttributeCreate,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Delete User Attribute
%% Deletes the attribute and all its related data.  Note: If the attribute is used by policies, removing it will cause the attribute to evaluate as `undefined`.
-spec delete_user_attribute(ctx:ctx(), binary(), binary(), binary()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
delete_user_attribute(Ctx, ProjId, EnvId, AttributeId) ->
    delete_user_attribute(Ctx, ProjId, EnvId, AttributeId, #{}).

-spec delete_user_attribute(ctx:ctx(), binary(), binary(), binary(), maps:map()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
delete_user_attribute(Ctx, ProjId, EnvId, AttributeId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = delete,
    Path = [<<"/v2/schema/", ProjId, "/", EnvId, "/users/attributes/", AttributeId, "">>],
    QS = lists:flatten([])++openapi_utils:optional_params(['resource_id', 'page', 'per_page'], _OptionalParams),
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Get User Attribute
%% Gets a single attribute defined on the User resource, if such attribute exists.
-spec get_user_attribute(ctx:ctx(), binary(), binary(), binary()) -> {ok, openapi_resource_attribute_read:openapi_resource_attribute_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_user_attribute(Ctx, ProjId, EnvId, AttributeId) ->
    get_user_attribute(Ctx, ProjId, EnvId, AttributeId, #{}).

-spec get_user_attribute(ctx:ctx(), binary(), binary(), binary(), maps:map()) -> {ok, openapi_resource_attribute_read:openapi_resource_attribute_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_user_attribute(Ctx, ProjId, EnvId, AttributeId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = [<<"/v2/schema/", ProjId, "/", EnvId, "/users/attributes/", AttributeId, "">>],
    QS = lists:flatten([])++openapi_utils:optional_params(['resource_id'], _OptionalParams),
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc List User Attributes
%% Lists all the attributes defined on the User resource.
-spec list_user_attributes(ctx:ctx(), binary(), binary()) -> {ok, [openapi_resource_attribute_read:openapi_resource_attribute_read()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
list_user_attributes(Ctx, ProjId, EnvId) ->
    list_user_attributes(Ctx, ProjId, EnvId, #{}).

-spec list_user_attributes(ctx:ctx(), binary(), binary(), maps:map()) -> {ok, [openapi_resource_attribute_read:openapi_resource_attribute_read()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
list_user_attributes(Ctx, ProjId, EnvId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = [<<"/v2/schema/", ProjId, "/", EnvId, "/users/attributes">>],
    QS = lists:flatten([])++openapi_utils:optional_params(['resource_id', 'page', 'per_page'], _OptionalParams),
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Update User Attribute
%% Partially updates the attribute defined on the User resource. Fields that will be provided will be completely overwritten.
-spec update_user_attribute(ctx:ctx(), binary(), binary(), binary(), openapi_resource_attribute_update:openapi_resource_attribute_update()) -> {ok, openapi_resource_attribute_read:openapi_resource_attribute_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
update_user_attribute(Ctx, ProjId, EnvId, AttributeId, OpenapiResourceAttributeUpdate) ->
    update_user_attribute(Ctx, ProjId, EnvId, AttributeId, OpenapiResourceAttributeUpdate, #{}).

-spec update_user_attribute(ctx:ctx(), binary(), binary(), binary(), openapi_resource_attribute_update:openapi_resource_attribute_update(), maps:map()) -> {ok, openapi_resource_attribute_read:openapi_resource_attribute_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
update_user_attribute(Ctx, ProjId, EnvId, AttributeId, OpenapiResourceAttributeUpdate, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = patch,
    Path = [<<"/v2/schema/", ProjId, "/", EnvId, "/users/attributes/", AttributeId, "">>],
    QS = lists:flatten([])++openapi_utils:optional_params(['resource_id'], _OptionalParams),
    Headers = [],
    Body1 = OpenapiResourceAttributeUpdate,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).


