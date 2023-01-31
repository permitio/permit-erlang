-module(openapi_projects_api).

-export([create_project/2, create_project/3,
         delete_project/2, delete_project/3,
         get_project/2, get_project/3,
         list_projects/1, list_projects/2,
         update_project/3, update_project/4]).

-define(BASE_URL, <<"">>).

%% @doc Create Project
%% Creates a new project under the active organization.
-spec create_project(ctx:ctx(), openapi_project_create:openapi_project_create()) -> {ok, openapi_project_read:openapi_project_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
create_project(Ctx, OpenapiProjectCreate) ->
    create_project(Ctx, OpenapiProjectCreate, #{}).

-spec create_project(ctx:ctx(), openapi_project_create:openapi_project_create(), maps:map()) -> {ok, openapi_project_read:openapi_project_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
create_project(Ctx, OpenapiProjectCreate, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = post,
    Path = [<<"/v2/projects">>],
    QS = [],
    Headers = [],
    Body1 = OpenapiProjectCreate,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Delete Project
%% Deletes the project and all its related data.
-spec delete_project(ctx:ctx(), binary()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
delete_project(Ctx, ProjId) ->
    delete_project(Ctx, ProjId, #{}).

-spec delete_project(ctx:ctx(), binary(), maps:map()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
delete_project(Ctx, ProjId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = delete,
    Path = [<<"/v2/projects/", ProjId, "">>],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Get Project
%% Gets a single project matching the given proj_id, if such project exists.
-spec get_project(ctx:ctx(), binary()) -> {ok, openapi_project_read:openapi_project_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_project(Ctx, ProjId) ->
    get_project(Ctx, ProjId, #{}).

-spec get_project(ctx:ctx(), binary(), maps:map()) -> {ok, openapi_project_read:openapi_project_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_project(Ctx, ProjId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = [<<"/v2/projects/", ProjId, "">>],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc List Projects
%% Lists all the projects under the active organization.
-spec list_projects(ctx:ctx()) -> {ok, [openapi_project_read:openapi_project_read()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
list_projects(Ctx) ->
    list_projects(Ctx, #{}).

-spec list_projects(ctx:ctx(), maps:map()) -> {ok, [openapi_project_read:openapi_project_read()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
list_projects(Ctx, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = [<<"/v2/projects">>],
    QS = lists:flatten([])++openapi_utils:optional_params(['page', 'per_page'], _OptionalParams),
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Update Project
%% Updates the project.
-spec update_project(ctx:ctx(), binary(), openapi_project_update:openapi_project_update()) -> {ok, openapi_project_read:openapi_project_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
update_project(Ctx, ProjId, OpenapiProjectUpdate) ->
    update_project(Ctx, ProjId, OpenapiProjectUpdate, #{}).

-spec update_project(ctx:ctx(), binary(), openapi_project_update:openapi_project_update(), maps:map()) -> {ok, openapi_project_read:openapi_project_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
update_project(Ctx, ProjId, OpenapiProjectUpdate, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = patch,
    Path = [<<"/v2/projects/", ProjId, "">>],
    QS = [],
    Headers = [],
    Body1 = OpenapiProjectUpdate,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).


