-module(openapi_resource_roles_api).

-export([add_parent_resource_role/6, add_parent_resource_role/7,
         assign_permissions_to_resource_role/6, assign_permissions_to_resource_role/7,
         create_resource_role/5, create_resource_role/6,
         delete_resource_role/5, delete_resource_role/6,
         get_resource_role/5, get_resource_role/6,
         list_resource_roles/4, list_resource_roles/5,
         remove_parent_resource_role/6, remove_parent_resource_role/7,
         remove_permissions_from_resource_role/6, remove_permissions_from_resource_role/7,
         update_resource_role/6, update_resource_role/7]).

-define(BASE_URL, <<"">>).

%% @doc Add Parent Role
%% This endpoint is part of the role hierarchy feature.  Makes role with id `role_id` extend the role with id `parent_role_id`. In other words, `role_id` will automatically be assigned any permissions that are granted to `parent_role_id`.  We can say the `role_id` **extends** `parent_role_id` or **inherits** from `parent_role_id`.  If `role_id` is already an ancestor of `parent_role_id`, the request will fail with HTTP 400 to prevent a cycle in the role hierarchy.  Both roles must be defined on the same resource, identified by id `resource_id`.
-spec add_parent_resource_role(ctx:ctx(), binary(), binary(), binary(), binary(), binary()) -> {ok, openapi_resource_role_read:openapi_resource_role_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
add_parent_resource_role(Ctx, ProjId, EnvId, ResourceId, RoleId, ParentRoleId) ->
    add_parent_resource_role(Ctx, ProjId, EnvId, ResourceId, RoleId, ParentRoleId, #{}).

-spec add_parent_resource_role(ctx:ctx(), binary(), binary(), binary(), binary(), binary(), maps:map()) -> {ok, openapi_resource_role_read:openapi_resource_role_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
add_parent_resource_role(Ctx, ProjId, EnvId, ResourceId, RoleId, ParentRoleId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = put,
    Path = [<<"/v2/schema/", ProjId, "/", EnvId, "/resources/", ResourceId, "/roles/", RoleId, "/parents/", ParentRoleId, "">>],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Assign Permissions to Role
%% Assign permissions to role.  If some of the permissions specified are already unassigned, will skip them.
-spec assign_permissions_to_resource_role(ctx:ctx(), binary(), binary(), binary(), binary(), openapi_add_role_permissions:openapi_add_role_permissions()) -> {ok, openapi_resource_role_read:openapi_resource_role_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
assign_permissions_to_resource_role(Ctx, ProjId, EnvId, ResourceId, RoleId, OpenapiAddRolePermissions) ->
    assign_permissions_to_resource_role(Ctx, ProjId, EnvId, ResourceId, RoleId, OpenapiAddRolePermissions, #{}).

-spec assign_permissions_to_resource_role(ctx:ctx(), binary(), binary(), binary(), binary(), openapi_add_role_permissions:openapi_add_role_permissions(), maps:map()) -> {ok, openapi_resource_role_read:openapi_resource_role_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
assign_permissions_to_resource_role(Ctx, ProjId, EnvId, ResourceId, RoleId, OpenapiAddRolePermissions, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = post,
    Path = [<<"/v2/schema/", ProjId, "/", EnvId, "/resources/", ResourceId, "/roles/", RoleId, "/permissions">>],
    QS = [],
    Headers = [],
    Body1 = OpenapiAddRolePermissions,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Create Resource Role
%% Creates a new role associated with the resource.
-spec create_resource_role(ctx:ctx(), binary(), binary(), binary(), openapi_resource_role_create:openapi_resource_role_create()) -> {ok, openapi_resource_role_read:openapi_resource_role_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
create_resource_role(Ctx, ProjId, EnvId, ResourceId, OpenapiResourceRoleCreate) ->
    create_resource_role(Ctx, ProjId, EnvId, ResourceId, OpenapiResourceRoleCreate, #{}).

-spec create_resource_role(ctx:ctx(), binary(), binary(), binary(), openapi_resource_role_create:openapi_resource_role_create(), maps:map()) -> {ok, openapi_resource_role_read:openapi_resource_role_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
create_resource_role(Ctx, ProjId, EnvId, ResourceId, OpenapiResourceRoleCreate, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = post,
    Path = [<<"/v2/schema/", ProjId, "/", EnvId, "/resources/", ResourceId, "/roles">>],
    QS = [],
    Headers = [],
    Body1 = OpenapiResourceRoleCreate,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Delete Resource Role
%% Deletes the role and all its related data. This includes any permissions granted to said role.
-spec delete_resource_role(ctx:ctx(), binary(), binary(), binary(), binary()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
delete_resource_role(Ctx, ProjId, EnvId, ResourceId, RoleId) ->
    delete_resource_role(Ctx, ProjId, EnvId, ResourceId, RoleId, #{}).

-spec delete_resource_role(ctx:ctx(), binary(), binary(), binary(), binary(), maps:map()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
delete_resource_role(Ctx, ProjId, EnvId, ResourceId, RoleId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = delete,
    Path = [<<"/v2/schema/", ProjId, "/", EnvId, "/resources/", ResourceId, "/roles/", RoleId, "">>],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Get Resource Role
%% Gets a single role defined on the resource, if such role exists.
-spec get_resource_role(ctx:ctx(), binary(), binary(), binary(), binary()) -> {ok, openapi_resource_role_read:openapi_resource_role_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_resource_role(Ctx, ProjId, EnvId, ResourceId, RoleId) ->
    get_resource_role(Ctx, ProjId, EnvId, ResourceId, RoleId, #{}).

-spec get_resource_role(ctx:ctx(), binary(), binary(), binary(), binary(), maps:map()) -> {ok, openapi_resource_role_read:openapi_resource_role_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_resource_role(Ctx, ProjId, EnvId, ResourceId, RoleId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = [<<"/v2/schema/", ProjId, "/", EnvId, "/resources/", ResourceId, "/roles/", RoleId, "">>],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc List Resource Roles
%% Lists all the roles defined on the resource.
-spec list_resource_roles(ctx:ctx(), binary(), binary(), binary()) -> {ok, [openapi_resource_role_read:openapi_resource_role_read()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
list_resource_roles(Ctx, ProjId, EnvId, ResourceId) ->
    list_resource_roles(Ctx, ProjId, EnvId, ResourceId, #{}).

-spec list_resource_roles(ctx:ctx(), binary(), binary(), binary(), maps:map()) -> {ok, [openapi_resource_role_read:openapi_resource_role_read()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
list_resource_roles(Ctx, ProjId, EnvId, ResourceId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = [<<"/v2/schema/", ProjId, "/", EnvId, "/resources/", ResourceId, "/roles">>],
    QS = lists:flatten([])++openapi_utils:optional_params(['page', 'per_page'], _OptionalParams),
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Remove Parent Role
%% This endpoint is part of the role hierarchy feature.  Removes `parent_role_id` from the list of parent roles of role with id `role_id`. In other words, `role_id` will no longer be automatically assigned permissions that are granted to `parent_role_id`.  We can say the `role_id` **not longer extends** `parent_role_id` or **no longer inherits** from `parent_role_id`.  Both roles must be defined on the same resource, identified by id `resource_id`.
-spec remove_parent_resource_role(ctx:ctx(), binary(), binary(), binary(), binary(), binary()) -> {ok, openapi_resource_role_read:openapi_resource_role_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
remove_parent_resource_role(Ctx, ProjId, EnvId, ResourceId, RoleId, ParentRoleId) ->
    remove_parent_resource_role(Ctx, ProjId, EnvId, ResourceId, RoleId, ParentRoleId, #{}).

-spec remove_parent_resource_role(ctx:ctx(), binary(), binary(), binary(), binary(), binary(), maps:map()) -> {ok, openapi_resource_role_read:openapi_resource_role_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
remove_parent_resource_role(Ctx, ProjId, EnvId, ResourceId, RoleId, ParentRoleId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = delete,
    Path = [<<"/v2/schema/", ProjId, "/", EnvId, "/resources/", ResourceId, "/roles/", RoleId, "/parents/", ParentRoleId, "">>],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Remove Permissions from Role
%% Remove permissions from role.  If some of the permissions specified are already unassigned, will skip them.
-spec remove_permissions_from_resource_role(ctx:ctx(), binary(), binary(), binary(), binary(), openapi_remove_role_permissions:openapi_remove_role_permissions()) -> {ok, openapi_resource_role_read:openapi_resource_role_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
remove_permissions_from_resource_role(Ctx, ProjId, EnvId, ResourceId, RoleId, OpenapiRemoveRolePermissions) ->
    remove_permissions_from_resource_role(Ctx, ProjId, EnvId, ResourceId, RoleId, OpenapiRemoveRolePermissions, #{}).

-spec remove_permissions_from_resource_role(ctx:ctx(), binary(), binary(), binary(), binary(), openapi_remove_role_permissions:openapi_remove_role_permissions(), maps:map()) -> {ok, openapi_resource_role_read:openapi_resource_role_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
remove_permissions_from_resource_role(Ctx, ProjId, EnvId, ResourceId, RoleId, OpenapiRemoveRolePermissions, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = delete,
    Path = [<<"/v2/schema/", ProjId, "/", EnvId, "/resources/", ResourceId, "/roles/", RoleId, "/permissions">>],
    QS = [],
    Headers = [],
    Body1 = OpenapiRemoveRolePermissions,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Update Resource Role
%% Partially updates the role defined on a resource. Fields that will be provided will be completely overwritten.
-spec update_resource_role(ctx:ctx(), binary(), binary(), binary(), binary(), openapi_resource_role_update:openapi_resource_role_update()) -> {ok, openapi_resource_role_read:openapi_resource_role_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
update_resource_role(Ctx, ProjId, EnvId, ResourceId, RoleId, OpenapiResourceRoleUpdate) ->
    update_resource_role(Ctx, ProjId, EnvId, ResourceId, RoleId, OpenapiResourceRoleUpdate, #{}).

-spec update_resource_role(ctx:ctx(), binary(), binary(), binary(), binary(), openapi_resource_role_update:openapi_resource_role_update(), maps:map()) -> {ok, openapi_resource_role_read:openapi_resource_role_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
update_resource_role(Ctx, ProjId, EnvId, ResourceId, RoleId, OpenapiResourceRoleUpdate, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = patch,
    Path = [<<"/v2/schema/", ProjId, "/", EnvId, "/resources/", ResourceId, "/roles/", RoleId, "">>],
    QS = [],
    Headers = [],
    Body1 = OpenapiResourceRoleUpdate,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).


