-module(openapi_tenants_api).

-export([create_tenant/4, create_tenant/5,
         delete_tenant/4, delete_tenant/5,
         delete_tenant_user/5, delete_tenant_user/6,
         get_tenant/4, get_tenant/5,
         list_tenant_users/4, list_tenant_users/5,
         list_tenants/3, list_tenants/4,
         update_tenant/5, update_tenant/6]).

-define(BASE_URL, <<"">>).

%% @doc Create Tenant
%% Creates a new tenant inside the Permit.io system.  If the tenant is already created: will return 200 instead of 201, and will return the existing tenant object in the response body.
-spec create_tenant(ctx:ctx(), binary(), binary(), openapi_tenant_create:openapi_tenant_create()) -> {ok, openapi_tenant_read:openapi_tenant_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
create_tenant(Ctx, ProjId, EnvId, OpenapiTenantCreate) ->
    create_tenant(Ctx, ProjId, EnvId, OpenapiTenantCreate, #{}).

-spec create_tenant(ctx:ctx(), binary(), binary(), openapi_tenant_create:openapi_tenant_create(), maps:map()) -> {ok, openapi_tenant_read:openapi_tenant_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
create_tenant(Ctx, ProjId, EnvId, OpenapiTenantCreate, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = post,
    Path = [<<"/v2/facts/", ProjId, "/", EnvId, "/tenants">>],
    QS = [],
    Headers = [],
    Body1 = OpenapiTenantCreate,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Delete Tenant
%% Deletes the tenant and all its related data.
-spec delete_tenant(ctx:ctx(), binary(), binary(), binary()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
delete_tenant(Ctx, ProjId, EnvId, TenantId) ->
    delete_tenant(Ctx, ProjId, EnvId, TenantId, #{}).

-spec delete_tenant(ctx:ctx(), binary(), binary(), binary(), maps:map()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
delete_tenant(Ctx, ProjId, EnvId, TenantId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = delete,
    Path = [<<"/v2/facts/", ProjId, "/", EnvId, "/tenants/", TenantId, "">>],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Delete Tenant User
%% Deletes a user under a tenant.
-spec delete_tenant_user(ctx:ctx(), binary(), binary(), binary(), binary()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
delete_tenant_user(Ctx, ProjId, EnvId, TenantId, UserId) ->
    delete_tenant_user(Ctx, ProjId, EnvId, TenantId, UserId, #{}).

-spec delete_tenant_user(ctx:ctx(), binary(), binary(), binary(), binary(), maps:map()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
delete_tenant_user(Ctx, ProjId, EnvId, TenantId, UserId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = delete,
    Path = [<<"/v2/facts/", ProjId, "/", EnvId, "/tenants/", TenantId, "/users/", UserId, "">>],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Get Tenant
%% Gets a tenant, if such tenant exists. Otherwise returns 404.
-spec get_tenant(ctx:ctx(), binary(), binary(), binary()) -> {ok, openapi_tenant_read:openapi_tenant_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_tenant(Ctx, ProjId, EnvId, TenantId) ->
    get_tenant(Ctx, ProjId, EnvId, TenantId, #{}).

-spec get_tenant(ctx:ctx(), binary(), binary(), binary(), maps:map()) -> {ok, openapi_tenant_read:openapi_tenant_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_tenant(Ctx, ProjId, EnvId, TenantId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = [<<"/v2/facts/", ProjId, "/", EnvId, "/tenants/", TenantId, "">>],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc List Tenant Users
%% 
-spec list_tenant_users(ctx:ctx(), binary(), binary(), binary()) -> {ok, openapi_paginated_result_user_read_:openapi_paginated_result_user_read_(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
list_tenant_users(Ctx, ProjId, TenantId, EnvId) ->
    list_tenant_users(Ctx, ProjId, TenantId, EnvId, #{}).

-spec list_tenant_users(ctx:ctx(), binary(), binary(), binary(), maps:map()) -> {ok, openapi_paginated_result_user_read_:openapi_paginated_result_user_read_(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
list_tenant_users(Ctx, ProjId, TenantId, EnvId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = [<<"/v2/facts/", ProjId, "/", EnvId, "/tenants/", TenantId, "/users">>],
    QS = lists:flatten([])++openapi_utils:optional_params(['search', 'page', 'per_page'], _OptionalParams),
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc List Tenants
%% Lists all the tenants defined within an environment.
-spec list_tenants(ctx:ctx(), binary(), binary()) -> {ok, [openapi_tenant_read:openapi_tenant_read()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
list_tenants(Ctx, ProjId, EnvId) ->
    list_tenants(Ctx, ProjId, EnvId, #{}).

-spec list_tenants(ctx:ctx(), binary(), binary(), maps:map()) -> {ok, [openapi_tenant_read:openapi_tenant_read()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
list_tenants(Ctx, ProjId, EnvId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = [<<"/v2/facts/", ProjId, "/", EnvId, "/tenants">>],
    QS = lists:flatten([])++openapi_utils:optional_params(['search', 'page', 'per_page'], _OptionalParams),
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Update Tenant
%% Partially updates the tenant definition. Fields that will be provided will be completely overwritten.
-spec update_tenant(ctx:ctx(), binary(), binary(), binary(), openapi_tenant_update:openapi_tenant_update()) -> {ok, openapi_tenant_read:openapi_tenant_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
update_tenant(Ctx, ProjId, EnvId, TenantId, OpenapiTenantUpdate) ->
    update_tenant(Ctx, ProjId, EnvId, TenantId, OpenapiTenantUpdate, #{}).

-spec update_tenant(ctx:ctx(), binary(), binary(), binary(), openapi_tenant_update:openapi_tenant_update(), maps:map()) -> {ok, openapi_tenant_read:openapi_tenant_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
update_tenant(Ctx, ProjId, EnvId, TenantId, OpenapiTenantUpdate, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = patch,
    Path = [<<"/v2/facts/", ProjId, "/", EnvId, "/tenants/", TenantId, "">>],
    QS = [],
    Headers = [],
    Body1 = OpenapiTenantUpdate,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).


