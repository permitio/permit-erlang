-module(openapi_environments_api).

-export([create_environment/3, create_environment/4,
         delete_environment/3, delete_environment/4,
         get_environment/3, get_environment/4,
         list_environments/2, list_environments/3,
         stats_environments/3, stats_environments/4,
         update_environment/4, update_environment/5]).

-define(BASE_URL, <<"">>).

%% @doc Create Environment
%% Creates a new environment under a given project.
-spec create_environment(ctx:ctx(), binary(), openapi_environment_create:openapi_environment_create()) -> {ok, openapi_environment_read:openapi_environment_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
create_environment(Ctx, ProjId, OpenapiEnvironmentCreate) ->
    create_environment(Ctx, ProjId, OpenapiEnvironmentCreate, #{}).

-spec create_environment(ctx:ctx(), binary(), openapi_environment_create:openapi_environment_create(), maps:map()) -> {ok, openapi_environment_read:openapi_environment_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
create_environment(Ctx, ProjId, OpenapiEnvironmentCreate, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = post,
    Path = [<<"/v2/projects/", ProjId, "/envs">>],
    QS = [],
    Headers = [],
    Body1 = OpenapiEnvironmentCreate,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Delete Environment
%% Deletes an environment and all its related data.
-spec delete_environment(ctx:ctx(), binary(), binary()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
delete_environment(Ctx, ProjId, EnvId) ->
    delete_environment(Ctx, ProjId, EnvId, #{}).

-spec delete_environment(ctx:ctx(), binary(), binary(), maps:map()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
delete_environment(Ctx, ProjId, EnvId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = delete,
    Path = [<<"/v2/projects/", ProjId, "/envs/", EnvId, "">>],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Get Environment
%% Gets a single environment matching the given env_id, if such environment exists.
-spec get_environment(ctx:ctx(), binary(), binary()) -> {ok, openapi_environment_read:openapi_environment_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_environment(Ctx, ProjId, EnvId) ->
    get_environment(Ctx, ProjId, EnvId, #{}).

-spec get_environment(ctx:ctx(), binary(), binary(), maps:map()) -> {ok, openapi_environment_read:openapi_environment_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_environment(Ctx, ProjId, EnvId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = [<<"/v2/projects/", ProjId, "/envs/", EnvId, "">>],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc List Environments
%% Lists all the environments under a given project.
-spec list_environments(ctx:ctx(), binary()) -> {ok, [openapi_environment_read:openapi_environment_read()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
list_environments(Ctx, ProjId) ->
    list_environments(Ctx, ProjId, #{}).

-spec list_environments(ctx:ctx(), binary(), maps:map()) -> {ok, [openapi_environment_read:openapi_environment_read()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
list_environments(Ctx, ProjId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = [<<"/v2/projects/", ProjId, "/envs">>],
    QS = lists:flatten([])++openapi_utils:optional_params(['page', 'per_page'], _OptionalParams),
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Stats Environments
%% 
-spec stats_environments(ctx:ctx(), binary(), binary()) -> {ok, openapi_environment_stats:openapi_environment_stats(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
stats_environments(Ctx, ProjId, EnvId) ->
    stats_environments(Ctx, ProjId, EnvId, #{}).

-spec stats_environments(ctx:ctx(), binary(), binary(), maps:map()) -> {ok, openapi_environment_stats:openapi_environment_stats(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
stats_environments(Ctx, ProjId, EnvId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = [<<"/v2/projects/", ProjId, "/envs/", EnvId, "/stats">>],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Update Environment
%% Updates the environment.
-spec update_environment(ctx:ctx(), binary(), binary(), openapi_environment_update:openapi_environment_update()) -> {ok, openapi_environment_read:openapi_environment_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
update_environment(Ctx, ProjId, EnvId, OpenapiEnvironmentUpdate) ->
    update_environment(Ctx, ProjId, EnvId, OpenapiEnvironmentUpdate, #{}).

-spec update_environment(ctx:ctx(), binary(), binary(), openapi_environment_update:openapi_environment_update(), maps:map()) -> {ok, openapi_environment_read:openapi_environment_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
update_environment(Ctx, ProjId, EnvId, OpenapiEnvironmentUpdate, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = patch,
    Path = [<<"/v2/projects/", ProjId, "/envs/", EnvId, "">>],
    QS = [],
    Headers = [],
    Body1 = OpenapiEnvironmentUpdate,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).


