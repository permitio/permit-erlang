-module(openapi_policy_git_repositories_api).

-export([activate_policy_repo/3, activate_policy_repo/4,
         create_policy_repo/3, create_policy_repo/4,
         delete_policy_repo/3, delete_policy_repo/4,
         disable_active_policy_repo/2, disable_active_policy_repo/3,
         get_active_policy_repo/2, get_active_policy_repo/3,
         get_policy_repo/3, get_policy_repo/4,
         list_policy_repos/2, list_policy_repos/3]).

-define(BASE_URL, <<"">>).

%% @doc Activate Policy Repo
%% Disable the currently active policy repo, this action means to turn off the gitops feature. If there is no active policy repo, this action will do nothing.
-spec activate_policy_repo(ctx:ctx(), binary(), binary()) -> {ok, openapi_project_read:openapi_project_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
activate_policy_repo(Ctx, ProjId, RepoId) ->
    activate_policy_repo(Ctx, ProjId, RepoId, #{}).

-spec activate_policy_repo(ctx:ctx(), binary(), binary(), maps:map()) -> {ok, openapi_project_read:openapi_project_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
activate_policy_repo(Ctx, ProjId, RepoId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = put,
    Path = [<<"/v2/projects/", ProjId, "/repos/", RepoId, "/activate">>],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Create Policy Repo
%% Creates a new policy repository configuration under a given project. The given repository is created with status 'pending', it will be changed and used as the 'active' repository for the policy only after a successful attempt to use it. The repository main branch must be present in the remote.
-spec create_policy_repo(ctx:ctx(), binary(), openapi_policy_repo_create:openapi_policy_repo_create()) -> {ok, openapi_policy_repo_read:openapi_policy_repo_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
create_policy_repo(Ctx, ProjId, OpenapiPolicyRepoCreate) ->
    create_policy_repo(Ctx, ProjId, OpenapiPolicyRepoCreate, #{}).

-spec create_policy_repo(ctx:ctx(), binary(), openapi_policy_repo_create:openapi_policy_repo_create(), maps:map()) -> {ok, openapi_policy_repo_read:openapi_policy_repo_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
create_policy_repo(Ctx, ProjId, OpenapiPolicyRepoCreate, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = post,
    Path = [<<"/v2/projects/", ProjId, "/repos">>],
    QS = [],
    Headers = [],
    Body1 = OpenapiPolicyRepoCreate,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Delete Policy Repo
%% Deletes an environment and all its related data.
-spec delete_policy_repo(ctx:ctx(), binary(), binary()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
delete_policy_repo(Ctx, ProjId, RepoId) ->
    delete_policy_repo(Ctx, ProjId, RepoId, #{}).

-spec delete_policy_repo(ctx:ctx(), binary(), binary(), maps:map()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
delete_policy_repo(Ctx, ProjId, RepoId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = delete,
    Path = [<<"/v2/projects/", ProjId, "/repos/", RepoId, "">>],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Disable Active Policy Repo
%% Disable the currently active policy repo, this action means to turn off the gitops feature. If there is no active policy repo, this action will do nothing.
-spec disable_active_policy_repo(ctx:ctx(), binary()) -> {ok, openapi_project_read:openapi_project_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
disable_active_policy_repo(Ctx, ProjId) ->
    disable_active_policy_repo(Ctx, ProjId, #{}).

-spec disable_active_policy_repo(ctx:ctx(), binary(), maps:map()) -> {ok, openapi_project_read:openapi_project_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
disable_active_policy_repo(Ctx, ProjId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = put,
    Path = [<<"/v2/projects/", ProjId, "/repos/disable">>],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Get Active Policy Repo
%% Gets the currently active repository, if such repository exists.
-spec get_active_policy_repo(ctx:ctx(), binary()) -> {ok, openapi_policy_repo_read:openapi_policy_repo_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_active_policy_repo(Ctx, ProjId) ->
    get_active_policy_repo(Ctx, ProjId, #{}).

-spec get_active_policy_repo(ctx:ctx(), binary(), maps:map()) -> {ok, openapi_policy_repo_read:openapi_policy_repo_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_active_policy_repo(Ctx, ProjId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = [<<"/v2/projects/", ProjId, "/repos/active">>],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Get Policy Repo
%% Gets a single repository matching the given repo_id, if such repository exists.
-spec get_policy_repo(ctx:ctx(), binary(), binary()) -> {ok, openapi_policy_repo_read:openapi_policy_repo_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_policy_repo(Ctx, ProjId, RepoId) ->
    get_policy_repo(Ctx, ProjId, RepoId, #{}).

-spec get_policy_repo(ctx:ctx(), binary(), binary(), maps:map()) -> {ok, openapi_policy_repo_read:openapi_policy_repo_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_policy_repo(Ctx, ProjId, RepoId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = [<<"/v2/projects/", ProjId, "/repos/", RepoId, "">>],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc List Policy Repos
%% Lists all the policy repositories under a given project.
-spec list_policy_repos(ctx:ctx(), binary()) -> {ok, [openapi_policy_repo_read:openapi_policy_repo_read()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
list_policy_repos(Ctx, ProjId) ->
    list_policy_repos(Ctx, ProjId, #{}).

-spec list_policy_repos(ctx:ctx(), binary(), maps:map()) -> {ok, [openapi_policy_repo_read:openapi_policy_repo_read()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
list_policy_repos(Ctx, ProjId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = [<<"/v2/projects/", ProjId, "/repos">>],
    QS = lists:flatten([])++openapi_utils:optional_params(['page', 'per_page'], _OptionalParams),
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).


