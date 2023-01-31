-module(openapi_resource_instances_api).

-export([create_resource_instance/4, create_resource_instance/5,
         delete_resource_instance/4, delete_resource_instance/5,
         get_resource_instance/4, get_resource_instance/5,
         list_resource_instances/3, list_resource_instances/4,
         update_resource_instance/5, update_resource_instance/6]).

-define(BASE_URL, <<"">>).

%% @doc Create Resource Instance
%% Creates a new instance inside the Permit.io system.  If the instance is already created: will return 200 instead of 201, and will return the existing instance object in the response body.
-spec create_resource_instance(ctx:ctx(), binary(), binary(), openapi_resource_instance_create:openapi_resource_instance_create()) -> {ok, openapi_resource_instance_read:openapi_resource_instance_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
create_resource_instance(Ctx, ProjId, EnvId, OpenapiResourceInstanceCreate) ->
    create_resource_instance(Ctx, ProjId, EnvId, OpenapiResourceInstanceCreate, #{}).

-spec create_resource_instance(ctx:ctx(), binary(), binary(), openapi_resource_instance_create:openapi_resource_instance_create(), maps:map()) -> {ok, openapi_resource_instance_read:openapi_resource_instance_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
create_resource_instance(Ctx, ProjId, EnvId, OpenapiResourceInstanceCreate, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = post,
    Path = [<<"/v2/facts/", ProjId, "/", EnvId, "/resource_instances">>],
    QS = [],
    Headers = [],
    Body1 = OpenapiResourceInstanceCreate,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Delete Resource Instance
%% Deletes the instance and all its related data.
-spec delete_resource_instance(ctx:ctx(), binary(), binary(), binary()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
delete_resource_instance(Ctx, ProjId, EnvId, InstanceId) ->
    delete_resource_instance(Ctx, ProjId, EnvId, InstanceId, #{}).

-spec delete_resource_instance(ctx:ctx(), binary(), binary(), binary(), maps:map()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
delete_resource_instance(Ctx, ProjId, EnvId, InstanceId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = delete,
    Path = [<<"/v2/facts/", ProjId, "/", EnvId, "/resource_instances/", InstanceId, "">>],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Get Resource Instance
%% Gets a instance, if such instance exists. Otherwise returns 404.
-spec get_resource_instance(ctx:ctx(), binary(), binary(), binary()) -> {ok, openapi_resource_instance_read:openapi_resource_instance_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_resource_instance(Ctx, ProjId, EnvId, InstanceId) ->
    get_resource_instance(Ctx, ProjId, EnvId, InstanceId, #{}).

-spec get_resource_instance(ctx:ctx(), binary(), binary(), binary(), maps:map()) -> {ok, openapi_resource_instance_read:openapi_resource_instance_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_resource_instance(Ctx, ProjId, EnvId, InstanceId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = [<<"/v2/facts/", ProjId, "/", EnvId, "/resource_instances/", InstanceId, "">>],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc List Resource Instances
%% Lists all the resource instances defined within an environment.
-spec list_resource_instances(ctx:ctx(), binary(), binary()) -> {ok, [openapi_resource_instance_read:openapi_resource_instance_read()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
list_resource_instances(Ctx, ProjId, EnvId) ->
    list_resource_instances(Ctx, ProjId, EnvId, #{}).

-spec list_resource_instances(ctx:ctx(), binary(), binary(), maps:map()) -> {ok, [openapi_resource_instance_read:openapi_resource_instance_read()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
list_resource_instances(Ctx, ProjId, EnvId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = [<<"/v2/facts/", ProjId, "/", EnvId, "/resource_instances">>],
    QS = lists:flatten([])++openapi_utils:optional_params(['page', 'per_page'], _OptionalParams),
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Update Resource Instance
%% Partially updates the instance definition. Fields that will be provided will be completely overwritten.
-spec update_resource_instance(ctx:ctx(), binary(), binary(), binary(), openapi_resource_instance_update:openapi_resource_instance_update()) -> {ok, openapi_resource_instance_read:openapi_resource_instance_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
update_resource_instance(Ctx, ProjId, EnvId, InstanceId, OpenapiResourceInstanceUpdate) ->
    update_resource_instance(Ctx, ProjId, EnvId, InstanceId, OpenapiResourceInstanceUpdate, #{}).

-spec update_resource_instance(ctx:ctx(), binary(), binary(), binary(), openapi_resource_instance_update:openapi_resource_instance_update(), maps:map()) -> {ok, openapi_resource_instance_read:openapi_resource_instance_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
update_resource_instance(Ctx, ProjId, EnvId, InstanceId, OpenapiResourceInstanceUpdate, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = patch,
    Path = [<<"/v2/facts/", ProjId, "/", EnvId, "/resource_instances/", InstanceId, "">>],
    QS = [],
    Headers = [],
    Body1 = OpenapiResourceInstanceUpdate,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).


