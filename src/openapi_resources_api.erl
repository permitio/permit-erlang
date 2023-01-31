-module(openapi_resources_api).

-export([create_resource/4, create_resource/5,
         delete_resource/4, delete_resource/5,
         get_resource/4, get_resource/5,
         list_resources/3, list_resources/4,
         replace_resource/5, replace_resource/6,
         update_resource/5, update_resource/6]).

-define(BASE_URL, <<"">>).

%% @doc Create Resource
%% Creates a new resource (a type of object you may protect with permissions).
-spec create_resource(ctx:ctx(), binary(), binary(), openapi_resource_create:openapi_resource_create()) -> {ok, openapi_resource_read:openapi_resource_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
create_resource(Ctx, ProjId, EnvId, OpenapiResourceCreate) ->
    create_resource(Ctx, ProjId, EnvId, OpenapiResourceCreate, #{}).

-spec create_resource(ctx:ctx(), binary(), binary(), openapi_resource_create:openapi_resource_create(), maps:map()) -> {ok, openapi_resource_read:openapi_resource_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
create_resource(Ctx, ProjId, EnvId, OpenapiResourceCreate, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = post,
    Path = [<<"/v2/schema/", ProjId, "/", EnvId, "/resources">>],
    QS = [],
    Headers = [],
    Body1 = OpenapiResourceCreate,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Delete Resource
%% Deletes the resource and all its related data.
-spec delete_resource(ctx:ctx(), binary(), binary(), binary()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
delete_resource(Ctx, ProjId, EnvId, ResourceId) ->
    delete_resource(Ctx, ProjId, EnvId, ResourceId, #{}).

-spec delete_resource(ctx:ctx(), binary(), binary(), binary(), maps:map()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
delete_resource(Ctx, ProjId, EnvId, ResourceId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = delete,
    Path = [<<"/v2/schema/", ProjId, "/", EnvId, "/resources/", ResourceId, "">>],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Get Resource
%% Gets a single resource, if such resource exists.
-spec get_resource(ctx:ctx(), binary(), binary(), binary()) -> {ok, openapi_resource_read:openapi_resource_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_resource(Ctx, ProjId, EnvId, ResourceId) ->
    get_resource(Ctx, ProjId, EnvId, ResourceId, #{}).

-spec get_resource(ctx:ctx(), binary(), binary(), binary(), maps:map()) -> {ok, openapi_resource_read:openapi_resource_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_resource(Ctx, ProjId, EnvId, ResourceId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = [<<"/v2/schema/", ProjId, "/", EnvId, "/resources/", ResourceId, "">>],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc List Resources
%% Lists all the resources defined in your schema.
-spec list_resources(ctx:ctx(), binary(), binary()) -> {ok, [openapi_resource_read:openapi_resource_read()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
list_resources(Ctx, ProjId, EnvId) ->
    list_resources(Ctx, ProjId, EnvId, #{}).

-spec list_resources(ctx:ctx(), binary(), binary(), maps:map()) -> {ok, [openapi_resource_read:openapi_resource_read()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
list_resources(Ctx, ProjId, EnvId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = [<<"/v2/schema/", ProjId, "/", EnvId, "/resources">>],
    QS = lists:flatten([])++openapi_utils:optional_params(['include_built_in', 'page', 'per_page'], _OptionalParams),
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Replace Resource
%% Completely replaces the resource definition.  - If the resource key is changed, all role and permissions assignments for the the resource will be revoked. - If the resource key is unchanged, but some actions are removed or renamed from the resource definition, role and permissions assignments for these actions will be revoked.  TODO: we need to decide if we are auto-revoking, or if we are rejecting the PUT completely while there are permissions that can be affected.
-spec replace_resource(ctx:ctx(), binary(), binary(), binary(), openapi_resource_replace:openapi_resource_replace()) -> {ok, openapi_resource_read:openapi_resource_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
replace_resource(Ctx, ProjId, EnvId, ResourceId, OpenapiResourceReplace) ->
    replace_resource(Ctx, ProjId, EnvId, ResourceId, OpenapiResourceReplace, #{}).

-spec replace_resource(ctx:ctx(), binary(), binary(), binary(), openapi_resource_replace:openapi_resource_replace(), maps:map()) -> {ok, openapi_resource_read:openapi_resource_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
replace_resource(Ctx, ProjId, EnvId, ResourceId, OpenapiResourceReplace, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = put,
    Path = [<<"/v2/schema/", ProjId, "/", EnvId, "/resources/", ResourceId, "">>],
    QS = [],
    Headers = [],
    Body1 = OpenapiResourceReplace,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Update Resource
%% Partially updates the resource definition. Fields that will be provided will be completely overwritten.
-spec update_resource(ctx:ctx(), binary(), binary(), binary(), openapi_resource_update:openapi_resource_update()) -> {ok, openapi_resource_read:openapi_resource_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
update_resource(Ctx, ProjId, EnvId, ResourceId, OpenapiResourceUpdate) ->
    update_resource(Ctx, ProjId, EnvId, ResourceId, OpenapiResourceUpdate, #{}).

-spec update_resource(ctx:ctx(), binary(), binary(), binary(), openapi_resource_update:openapi_resource_update(), maps:map()) -> {ok, openapi_resource_read:openapi_resource_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
update_resource(Ctx, ProjId, EnvId, ResourceId, OpenapiResourceUpdate, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = patch,
    Path = [<<"/v2/schema/", ProjId, "/", EnvId, "/resources/", ResourceId, "">>],
    QS = [],
    Headers = [],
    Body1 = OpenapiResourceUpdate,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).


