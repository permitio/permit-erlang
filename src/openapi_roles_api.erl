-module(openapi_roles_api).

-export([add_parent_role/5, add_parent_role/6,
         assign_permissions_to_role/5, assign_permissions_to_role/6,
         create_role/4, create_role/5,
         delete_role/4, delete_role/5,
         get_role/4, get_role/5,
         list_roles/3, list_roles/4,
         remove_parent_role/5, remove_parent_role/6,
         remove_permissions_from_role/5, remove_permissions_from_role/6,
         update_role/5, update_role/6]).

-define(BASE_URL, <<"">>).

%% @doc Add Parent Role
%% This endpoint is part of the role hierarchy feature.  Makes role with id `role_id` extend the role with id `parent_role_id`. In other words, `role_id` will automatically be assigned any permissions that are granted to `parent_role_id`.  We can say the `role_id` **extends** `parent_role_id` or **inherits** from `parent_role_id`.  If `role_id` is already an ancestor of `parent_role_id`, the request will fail with HTTP 400 to prevent a cycle in the role hierarchy.
-spec add_parent_role(ctx:ctx(), binary(), binary(), binary(), binary()) -> {ok, openapi_role_read:openapi_role_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
add_parent_role(Ctx, ProjId, EnvId, RoleId, ParentRoleId) ->
    add_parent_role(Ctx, ProjId, EnvId, RoleId, ParentRoleId, #{}).

-spec add_parent_role(ctx:ctx(), binary(), binary(), binary(), binary(), maps:map()) -> {ok, openapi_role_read:openapi_role_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
add_parent_role(Ctx, ProjId, EnvId, RoleId, ParentRoleId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = put,
    Path = [<<"/v2/schema/", ProjId, "/", EnvId, "/roles/", RoleId, "/parents/", ParentRoleId, "">>],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Assign Permissions To Role
%% Assign permissions to role.  If some of the permissions specified are already unassigned, will skip them.
-spec assign_permissions_to_role(ctx:ctx(), binary(), binary(), binary(), openapi_add_role_permissions:openapi_add_role_permissions()) -> {ok, openapi_role_read:openapi_role_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
assign_permissions_to_role(Ctx, ProjId, EnvId, RoleId, OpenapiAddRolePermissions) ->
    assign_permissions_to_role(Ctx, ProjId, EnvId, RoleId, OpenapiAddRolePermissions, #{}).

-spec assign_permissions_to_role(ctx:ctx(), binary(), binary(), binary(), openapi_add_role_permissions:openapi_add_role_permissions(), maps:map()) -> {ok, openapi_role_read:openapi_role_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
assign_permissions_to_role(Ctx, ProjId, EnvId, RoleId, OpenapiAddRolePermissions, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = post,
    Path = [<<"/v2/schema/", ProjId, "/", EnvId, "/roles/", RoleId, "/permissions">>],
    QS = [],
    Headers = [],
    Body1 = OpenapiAddRolePermissions,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Create Role
%% Creates a new tenant role.
-spec create_role(ctx:ctx(), binary(), binary(), openapi_role_create:openapi_role_create()) -> {ok, openapi_role_read:openapi_role_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
create_role(Ctx, ProjId, EnvId, OpenapiRoleCreate) ->
    create_role(Ctx, ProjId, EnvId, OpenapiRoleCreate, #{}).

-spec create_role(ctx:ctx(), binary(), binary(), openapi_role_create:openapi_role_create(), maps:map()) -> {ok, openapi_role_read:openapi_role_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
create_role(Ctx, ProjId, EnvId, OpenapiRoleCreate, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = post,
    Path = [<<"/v2/schema/", ProjId, "/", EnvId, "/roles">>],
    QS = [],
    Headers = [],
    Body1 = OpenapiRoleCreate,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Delete Role
%% Deletes a tenant role and all its related data. This includes any permissions granted to said role.
-spec delete_role(ctx:ctx(), binary(), binary(), binary()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
delete_role(Ctx, ProjId, EnvId, RoleId) ->
    delete_role(Ctx, ProjId, EnvId, RoleId, #{}).

-spec delete_role(ctx:ctx(), binary(), binary(), binary(), maps:map()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
delete_role(Ctx, ProjId, EnvId, RoleId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = delete,
    Path = [<<"/v2/schema/", ProjId, "/", EnvId, "/roles/", RoleId, "">>],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Get Role
%% Gets a single tenant role, if such role exists.
-spec get_role(ctx:ctx(), binary(), binary(), binary()) -> {ok, openapi_role_read:openapi_role_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_role(Ctx, ProjId, EnvId, RoleId) ->
    get_role(Ctx, ProjId, EnvId, RoleId, #{}).

-spec get_role(ctx:ctx(), binary(), binary(), binary(), maps:map()) -> {ok, openapi_role_read:openapi_role_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_role(Ctx, ProjId, EnvId, RoleId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = [<<"/v2/schema/", ProjId, "/", EnvId, "/roles/", RoleId, "">>],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc List Roles
%% Lists all tenant roles.
-spec list_roles(ctx:ctx(), binary(), binary()) -> {ok, [openapi_role_read:openapi_role_read()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
list_roles(Ctx, ProjId, EnvId) ->
    list_roles(Ctx, ProjId, EnvId, #{}).

-spec list_roles(ctx:ctx(), binary(), binary(), maps:map()) -> {ok, [openapi_role_read:openapi_role_read()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
list_roles(Ctx, ProjId, EnvId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = [<<"/v2/schema/", ProjId, "/", EnvId, "/roles">>],
    QS = lists:flatten([])++openapi_utils:optional_params(['page', 'per_page'], _OptionalParams),
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Remove Parent Role
%% This endpoint is part of the role hierarchy feature.  Removes `parent_role_id` from the list of parent roles of role with id `role_id`. In other words, `role_id` will no longer be automatically assigned permissions that are granted to `parent_role_id`.  We can say the `role_id` **not longer extends** `parent_role_id` or **no longer inherits** from `parent_role_id`.
-spec remove_parent_role(ctx:ctx(), binary(), binary(), binary(), binary()) -> {ok, openapi_role_read:openapi_role_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
remove_parent_role(Ctx, ProjId, EnvId, RoleId, ParentRoleId) ->
    remove_parent_role(Ctx, ProjId, EnvId, RoleId, ParentRoleId, #{}).

-spec remove_parent_role(ctx:ctx(), binary(), binary(), binary(), binary(), maps:map()) -> {ok, openapi_role_read:openapi_role_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
remove_parent_role(Ctx, ProjId, EnvId, RoleId, ParentRoleId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = delete,
    Path = [<<"/v2/schema/", ProjId, "/", EnvId, "/roles/", RoleId, "/parents/", ParentRoleId, "">>],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Remove Permissions From Role
%% Remove permissions from role.  If some of the permissions specified are already unassigned, will skip them.
-spec remove_permissions_from_role(ctx:ctx(), binary(), binary(), binary(), openapi_remove_role_permissions:openapi_remove_role_permissions()) -> {ok, openapi_role_read:openapi_role_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
remove_permissions_from_role(Ctx, ProjId, EnvId, RoleId, OpenapiRemoveRolePermissions) ->
    remove_permissions_from_role(Ctx, ProjId, EnvId, RoleId, OpenapiRemoveRolePermissions, #{}).

-spec remove_permissions_from_role(ctx:ctx(), binary(), binary(), binary(), openapi_remove_role_permissions:openapi_remove_role_permissions(), maps:map()) -> {ok, openapi_role_read:openapi_role_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
remove_permissions_from_role(Ctx, ProjId, EnvId, RoleId, OpenapiRemoveRolePermissions, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = delete,
    Path = [<<"/v2/schema/", ProjId, "/", EnvId, "/roles/", RoleId, "/permissions">>],
    QS = [],
    Headers = [],
    Body1 = OpenapiRemoveRolePermissions,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Update Role
%% Partially updates a tenant role. Fields that will be provided will be completely overwritten.
-spec update_role(ctx:ctx(), binary(), binary(), binary(), openapi_role_update:openapi_role_update()) -> {ok, openapi_role_read:openapi_role_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
update_role(Ctx, ProjId, EnvId, RoleId, OpenapiRoleUpdate) ->
    update_role(Ctx, ProjId, EnvId, RoleId, OpenapiRoleUpdate, #{}).

-spec update_role(ctx:ctx(), binary(), binary(), binary(), openapi_role_update:openapi_role_update(), maps:map()) -> {ok, openapi_role_read:openapi_role_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
update_role(Ctx, ProjId, EnvId, RoleId, OpenapiRoleUpdate, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = patch,
    Path = [<<"/v2/schema/", ProjId, "/", EnvId, "/roles/", RoleId, "">>],
    QS = [],
    Headers = [],
    Body1 = OpenapiRoleUpdate,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).


