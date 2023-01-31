-module(openapi_users_elements_data_api).

-export([elements_assign_role_to_user/6, elements_assign_role_to_user/7,
         elements_create_user/5, elements_create_user/6,
         elements_delete_user/5, elements_delete_user/6,
         elements_list_roles/4, elements_list_roles/5,
         elements_list_users/4, elements_list_users/5,
         elements_unassign_role_from_user/6, elements_unassign_role_from_user/7,
         set_config_active/4, set_config_active/5]).

-define(BASE_URL, <<"">>).

%% @doc Assign role to user
%% Assigns a role to the user within the tenant.  The tenant defines the scope of the assignment. In other words, the role is effective only within the tenant.
-spec elements_assign_role_to_user(ctx:ctx(), binary(), binary(), binary(), binary(), openapi_elements_user_role_create:openapi_elements_user_role_create()) -> {ok, openapi_role_assignment_read:openapi_role_assignment_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
elements_assign_role_to_user(Ctx, ProjId, EnvId, ElementsConfigId, UserId, OpenapiElementsUserRoleCreate) ->
    elements_assign_role_to_user(Ctx, ProjId, EnvId, ElementsConfigId, UserId, OpenapiElementsUserRoleCreate, #{}).

-spec elements_assign_role_to_user(ctx:ctx(), binary(), binary(), binary(), binary(), openapi_elements_user_role_create:openapi_elements_user_role_create(), maps:map()) -> {ok, openapi_role_assignment_read:openapi_role_assignment_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
elements_assign_role_to_user(Ctx, ProjId, EnvId, ElementsConfigId, UserId, OpenapiElementsUserRoleCreate, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = post,
    Path = [<<"/v2/elements/", ProjId, "/", EnvId, "/config/", ElementsConfigId, "/data/users/", UserId, "/roles">>],
    QS = [],
    Headers = [],
    Body1 = OpenapiElementsUserRoleCreate,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Create user
%% Creates a new user inside the Permit.io system, from that point forward you may run permission checks on that user.  If the user is already created: will return 200 instead of 201, and will return the existing user object in the response body.
-spec elements_create_user(ctx:ctx(), binary(), binary(), binary(), openapi_elements_user_create:openapi_elements_user_create()) -> {ok, openapi_user_read:openapi_user_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
elements_create_user(Ctx, ProjId, EnvId, ElementsConfigId, OpenapiElementsUserCreate) ->
    elements_create_user(Ctx, ProjId, EnvId, ElementsConfigId, OpenapiElementsUserCreate, #{}).

-spec elements_create_user(ctx:ctx(), binary(), binary(), binary(), openapi_elements_user_create:openapi_elements_user_create(), maps:map()) -> {ok, openapi_user_read:openapi_user_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
elements_create_user(Ctx, ProjId, EnvId, ElementsConfigId, OpenapiElementsUserCreate, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = post,
    Path = [<<"/v2/elements/", ProjId, "/", EnvId, "/config/", ElementsConfigId, "/data/users">>],
    QS = [],
    Headers = [],
    Body1 = OpenapiElementsUserCreate,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Delete user
%% 
-spec elements_delete_user(ctx:ctx(), binary(), binary(), binary(), binary()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
elements_delete_user(Ctx, ProjId, EnvId, ElementsConfigId, UserId) ->
    elements_delete_user(Ctx, ProjId, EnvId, ElementsConfigId, UserId, #{}).

-spec elements_delete_user(ctx:ctx(), binary(), binary(), binary(), binary(), maps:map()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
elements_delete_user(Ctx, ProjId, EnvId, ElementsConfigId, UserId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = delete,
    Path = [<<"/v2/elements/", ProjId, "/", EnvId, "/config/", ElementsConfigId, "/data/users/", UserId, "">>],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc List roles
%% Lists all the users defined within an environment.
-spec elements_list_roles(ctx:ctx(), binary(), binary(), binary()) -> {ok, [openapi_elements_role_read:openapi_elements_role_read()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
elements_list_roles(Ctx, ProjId, EnvId, ElementsConfigId) ->
    elements_list_roles(Ctx, ProjId, EnvId, ElementsConfigId, #{}).

-spec elements_list_roles(ctx:ctx(), binary(), binary(), binary(), maps:map()) -> {ok, [openapi_elements_role_read:openapi_elements_role_read()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
elements_list_roles(Ctx, ProjId, EnvId, ElementsConfigId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = [<<"/v2/elements/", ProjId, "/", EnvId, "/config/", ElementsConfigId, "/data/roles">>],
    QS = lists:flatten([])++openapi_utils:optional_params(['search', 'page', 'per_page'], _OptionalParams),
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc List users
%% Lists all the users defined within an environment.
-spec elements_list_users(ctx:ctx(), binary(), binary(), binary()) -> {ok, openapi_paginated_result_user_read_:openapi_paginated_result_user_read_(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
elements_list_users(Ctx, ProjId, EnvId, ElementsConfigId) ->
    elements_list_users(Ctx, ProjId, EnvId, ElementsConfigId, #{}).

-spec elements_list_users(ctx:ctx(), binary(), binary(), binary(), maps:map()) -> {ok, openapi_paginated_result_user_read_:openapi_paginated_result_user_read_(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
elements_list_users(Ctx, ProjId, EnvId, ElementsConfigId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = [<<"/v2/elements/", ProjId, "/", EnvId, "/config/", ElementsConfigId, "/data/users">>],
    QS = lists:flatten([])++openapi_utils:optional_params(['search', 'page', 'per_page'], _OptionalParams),
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Unassign role from user
%% Unassigns the role from the user within the tenant.  The tenant defines the scope of the assignment. In other words, the role is effective only within the tenant.  If the role is not actually assigned, will return 404.
-spec elements_unassign_role_from_user(ctx:ctx(), binary(), binary(), binary(), binary(), openapi_elements_user_role_remove:openapi_elements_user_role_remove()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
elements_unassign_role_from_user(Ctx, ProjId, EnvId, ElementsConfigId, UserId, OpenapiElementsUserRoleRemove) ->
    elements_unassign_role_from_user(Ctx, ProjId, EnvId, ElementsConfigId, UserId, OpenapiElementsUserRoleRemove, #{}).

-spec elements_unassign_role_from_user(ctx:ctx(), binary(), binary(), binary(), binary(), openapi_elements_user_role_remove:openapi_elements_user_role_remove(), maps:map()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
elements_unassign_role_from_user(Ctx, ProjId, EnvId, ElementsConfigId, UserId, OpenapiElementsUserRoleRemove, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = delete,
    Path = [<<"/v2/elements/", ProjId, "/", EnvId, "/config/", ElementsConfigId, "/data/users/", UserId, "/roles">>],
    QS = [],
    Headers = [],
    Body1 = OpenapiElementsUserRoleRemove,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Set Config Active
%% Updates the embed_config.
-spec set_config_active(ctx:ctx(), binary(), binary(), binary()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
set_config_active(Ctx, ElementsConfigId, ProjId, EnvId) ->
    set_config_active(Ctx, ElementsConfigId, ProjId, EnvId, #{}).

-spec set_config_active(ctx:ctx(), binary(), binary(), binary(), maps:map()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
set_config_active(Ctx, ElementsConfigId, ProjId, EnvId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = post,
    Path = [<<"/v2/elements/", ProjId, "/", EnvId, "/config/", ElementsConfigId, "/data/active">>],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).


