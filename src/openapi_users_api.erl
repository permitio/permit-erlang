-module(openapi_users_api).

-export([assign_role_to_user/5, assign_role_to_user/6,
         create_user/4, create_user/5,
         delete_user/4, delete_user/5,
         get_user/4, get_user/5,
         list_users/3, list_users/4,
         replace_user/5, replace_user/6,
         unassign_role_from_user/5, unassign_role_from_user/6,
         update_user/5, update_user/6]).

-define(BASE_URL, <<"">>).

%% @doc Assign Role To User
%% Assigns a role to the user within the tenant.  The tenant defines the scope of the assignment. In other words, the role is effective only within the tenant.
-spec assign_role_to_user(ctx:ctx(), binary(), binary(), binary(), openapi_user_role_create:openapi_user_role_create()) -> {ok, openapi_role_assignment_read:openapi_role_assignment_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
assign_role_to_user(Ctx, ProjId, EnvId, UserId, OpenapiUserRoleCreate) ->
    assign_role_to_user(Ctx, ProjId, EnvId, UserId, OpenapiUserRoleCreate, #{}).

-spec assign_role_to_user(ctx:ctx(), binary(), binary(), binary(), openapi_user_role_create:openapi_user_role_create(), maps:map()) -> {ok, openapi_role_assignment_read:openapi_role_assignment_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
assign_role_to_user(Ctx, ProjId, EnvId, UserId, OpenapiUserRoleCreate, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = post,
    Path = [<<"/v2/facts/", ProjId, "/", EnvId, "/users/", UserId, "/roles">>],
    QS = [],
    Headers = [],
    Body1 = OpenapiUserRoleCreate,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Create User
%% Creates a new user inside the Permit.io system, from that point forward you may run permission checks on that user.  If the user is already created: will return 200 instead of 201, and will return the existing user object in the response body.
-spec create_user(ctx:ctx(), binary(), binary(), openapi_user_create:openapi_user_create()) -> {ok, openapi_user_read:openapi_user_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
create_user(Ctx, ProjId, EnvId, OpenapiUserCreate) ->
    create_user(Ctx, ProjId, EnvId, OpenapiUserCreate, #{}).

-spec create_user(ctx:ctx(), binary(), binary(), openapi_user_create:openapi_user_create(), maps:map()) -> {ok, openapi_user_read:openapi_user_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
create_user(Ctx, ProjId, EnvId, OpenapiUserCreate, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = post,
    Path = [<<"/v2/facts/", ProjId, "/", EnvId, "/users">>],
    QS = [],
    Headers = [],
    Body1 = OpenapiUserCreate,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Delete User
%% Deletes the user and all its related data.
-spec delete_user(ctx:ctx(), binary(), binary(), binary()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
delete_user(Ctx, ProjId, EnvId, UserId) ->
    delete_user(Ctx, ProjId, EnvId, UserId, #{}).

-spec delete_user(ctx:ctx(), binary(), binary(), binary(), maps:map()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
delete_user(Ctx, ProjId, EnvId, UserId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = delete,
    Path = [<<"/v2/facts/", ProjId, "/", EnvId, "/users/", UserId, "">>],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Get User
%% Gets a user, if such user exists. Otherwise returns 404.
-spec get_user(ctx:ctx(), binary(), binary(), binary()) -> {ok, openapi_user_read:openapi_user_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_user(Ctx, ProjId, EnvId, UserId) ->
    get_user(Ctx, ProjId, EnvId, UserId, #{}).

-spec get_user(ctx:ctx(), binary(), binary(), binary(), maps:map()) -> {ok, openapi_user_read:openapi_user_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_user(Ctx, ProjId, EnvId, UserId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = [<<"/v2/facts/", ProjId, "/", EnvId, "/users/", UserId, "">>],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc List Users
%% Lists all the users defined within an environment.
-spec list_users(ctx:ctx(), binary(), binary()) -> {ok, openapi_paginated_result_user_read_:openapi_paginated_result_user_read_(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
list_users(Ctx, ProjId, EnvId) ->
    list_users(Ctx, ProjId, EnvId, #{}).

-spec list_users(ctx:ctx(), binary(), binary(), maps:map()) -> {ok, openapi_paginated_result_user_read_:openapi_paginated_result_user_read_(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
list_users(Ctx, ProjId, EnvId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = [<<"/v2/facts/", ProjId, "/", EnvId, "/users">>],
    QS = lists:flatten([])++openapi_utils:optional_params(['search', 'page', 'per_page'], _OptionalParams),
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Replace User
%% 
-spec replace_user(ctx:ctx(), binary(), binary(), binary(), openapi_user_create:openapi_user_create()) -> {ok, openapi_user_read:openapi_user_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
replace_user(Ctx, ProjId, EnvId, UserId, OpenapiUserCreate) ->
    replace_user(Ctx, ProjId, EnvId, UserId, OpenapiUserCreate, #{}).

-spec replace_user(ctx:ctx(), binary(), binary(), binary(), openapi_user_create:openapi_user_create(), maps:map()) -> {ok, openapi_user_read:openapi_user_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
replace_user(Ctx, ProjId, EnvId, UserId, OpenapiUserCreate, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = put,
    Path = [<<"/v2/facts/", ProjId, "/", EnvId, "/users/", UserId, "">>],
    QS = [],
    Headers = [],
    Body1 = OpenapiUserCreate,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Unassign Role From User
%% Unassigns the role from the user within the tenant.  The tenant defines the scope of the assignment. In other words, the role is effective only within the tenant.  If the role is not actually assigned, will return 404.
-spec unassign_role_from_user(ctx:ctx(), binary(), binary(), binary(), openapi_user_role_remove:openapi_user_role_remove()) -> {ok, openapi_user_read:openapi_user_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
unassign_role_from_user(Ctx, ProjId, EnvId, UserId, OpenapiUserRoleRemove) ->
    unassign_role_from_user(Ctx, ProjId, EnvId, UserId, OpenapiUserRoleRemove, #{}).

-spec unassign_role_from_user(ctx:ctx(), binary(), binary(), binary(), openapi_user_role_remove:openapi_user_role_remove(), maps:map()) -> {ok, openapi_user_read:openapi_user_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
unassign_role_from_user(Ctx, ProjId, EnvId, UserId, OpenapiUserRoleRemove, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = delete,
    Path = [<<"/v2/facts/", ProjId, "/", EnvId, "/users/", UserId, "/roles">>],
    QS = [],
    Headers = [],
    Body1 = OpenapiUserRoleRemove,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Update User
%% Partially updates the user definition. Fields that will be provided will be completely overwritten.
-spec update_user(ctx:ctx(), binary(), binary(), binary(), openapi_user_update:openapi_user_update()) -> {ok, openapi_user_read:openapi_user_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
update_user(Ctx, ProjId, EnvId, UserId, OpenapiUserUpdate) ->
    update_user(Ctx, ProjId, EnvId, UserId, OpenapiUserUpdate, #{}).

-spec update_user(ctx:ctx(), binary(), binary(), binary(), openapi_user_update:openapi_user_update(), maps:map()) -> {ok, openapi_user_read:openapi_user_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
update_user(Ctx, ProjId, EnvId, UserId, OpenapiUserUpdate, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = patch,
    Path = [<<"/v2/facts/", ProjId, "/", EnvId, "/users/", UserId, "">>],
    QS = [],
    Headers = [],
    Body1 = OpenapiUserUpdate,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).


