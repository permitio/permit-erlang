-module(openapi_role_assignments_api).

-export([assign_role/4, assign_role/5,
         list_role_assignments/3, list_role_assignments/4,
         unassign_role/4, unassign_role/5]).

-define(BASE_URL, <<"">>).

%% @doc Assign Role
%% Assigns a role to a user within a tenant.  The tenant defines the scope of the assignment. In other words, the role is effective only within the tenant.
-spec assign_role(ctx:ctx(), binary(), binary(), openapi_role_assignment_create:openapi_role_assignment_create()) -> {ok, openapi_role_assignment_read:openapi_role_assignment_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
assign_role(Ctx, ProjId, EnvId, OpenapiRoleAssignmentCreate) ->
    assign_role(Ctx, ProjId, EnvId, OpenapiRoleAssignmentCreate, #{}).

-spec assign_role(ctx:ctx(), binary(), binary(), openapi_role_assignment_create:openapi_role_assignment_create(), maps:map()) -> {ok, openapi_role_assignment_read:openapi_role_assignment_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
assign_role(Ctx, ProjId, EnvId, OpenapiRoleAssignmentCreate, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = post,
    Path = [<<"/v2/facts/", ProjId, "/", EnvId, "/role_assignments">>],
    QS = [],
    Headers = [],
    Body1 = OpenapiRoleAssignmentCreate,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc List Role Assignments
%% Lists the role assignments defined within an environment.  - If the `user` filter is present, will only return the role assignments of that user. - If the `tenant` filter is present, will only return the role assignments in that tenant. - If the `role` filter is present, will only return role assignments that are granting that role.
-spec list_role_assignments(ctx:ctx(), binary(), binary()) -> {ok, [openapi_role_assignment_read:openapi_role_assignment_read()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
list_role_assignments(Ctx, ProjId, EnvId) ->
    list_role_assignments(Ctx, ProjId, EnvId, #{}).

-spec list_role_assignments(ctx:ctx(), binary(), binary(), maps:map()) -> {ok, [openapi_role_assignment_read:openapi_role_assignment_read()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
list_role_assignments(Ctx, ProjId, EnvId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = [<<"/v2/facts/", ProjId, "/", EnvId, "/role_assignments">>],
    QS = lists:flatten([])++openapi_utils:optional_params(['user', 'role', 'tenant', 'page', 'per_page'], _OptionalParams),
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Unassign Role
%% Unassigns a user role within a tenant.  The tenant defines the scope of the assignment. In other words, the role is effective only within the tenant.  If the role is not actually assigned, will return 404.
-spec unassign_role(ctx:ctx(), binary(), binary(), openapi_role_assignment_remove:openapi_role_assignment_remove()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
unassign_role(Ctx, ProjId, EnvId, OpenapiRoleAssignmentRemove) ->
    unassign_role(Ctx, ProjId, EnvId, OpenapiRoleAssignmentRemove, #{}).

-spec unassign_role(ctx:ctx(), binary(), binary(), openapi_role_assignment_remove:openapi_role_assignment_remove(), maps:map()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
unassign_role(Ctx, ProjId, EnvId, OpenapiRoleAssignmentRemove, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = delete,
    Path = [<<"/v2/facts/", ProjId, "/", EnvId, "/role_assignments">>],
    QS = [],
    Headers = [],
    Body1 = OpenapiRoleAssignmentRemove,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).


