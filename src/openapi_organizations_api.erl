-module(openapi_organizations_api).

-export([cancel_invite/3, cancel_invite/4,
         create_organization/2, create_organization/3,
         delete_organization/2, delete_organization/3,
         get_active_organization/1, get_active_organization/2,
         get_organization/2, get_organization/3,
         invite_members_to_organization/3, invite_members_to_organization/4,
         list_organization_invites/2, list_organization_invites/3,
         list_organizations/1, list_organizations/2,
         update_organization/3, update_organization/4]).

-define(BASE_URL, <<"">>).

%% @doc Cancel Invite
%% Cancels an invite that was sent to a new member.
-spec cancel_invite(ctx:ctx(), binary(), openapi_u_uid:openapi_u_uid()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
cancel_invite(Ctx, OrgId, InviteId) ->
    cancel_invite(Ctx, OrgId, InviteId, #{}).

-spec cancel_invite(ctx:ctx(), binary(), openapi_u_uid:openapi_u_uid(), maps:map()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
cancel_invite(Ctx, OrgId, InviteId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = delete,
    Path = [<<"/v2/orgs/", OrgId, "/invites/", InviteId, "">>],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Create Organization
%% Creates a new organization that will be owned by the authenticated actor (i.e: human team member or api key).
-spec create_organization(ctx:ctx(), openapi_organization_create:openapi_organization_create()) -> {ok, openapi_organization_read_with_api_key:openapi_organization_read_with_api_key(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
create_organization(Ctx, OpenapiOrganizationCreate) ->
    create_organization(Ctx, OpenapiOrganizationCreate, #{}).

-spec create_organization(ctx:ctx(), openapi_organization_create:openapi_organization_create(), maps:map()) -> {ok, openapi_organization_read_with_api_key:openapi_organization_read_with_api_key(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
create_organization(Ctx, OpenapiOrganizationCreate, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = post,
    Path = [<<"/v2/orgs">>],
    QS = [],
    Headers = [],
    Body1 = OpenapiOrganizationCreate,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Delete Organization
%% Deletes an organization (Permit.io account) and all its related data.
-spec delete_organization(ctx:ctx(), binary()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
delete_organization(Ctx, OrgId) ->
    delete_organization(Ctx, OrgId, #{}).

-spec delete_organization(ctx:ctx(), binary(), maps:map()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
delete_organization(Ctx, OrgId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = delete,
    Path = [<<"/v2/orgs/", OrgId, "">>],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Get Active Organization
%% Gets a single organization (Permit.io account) matching the given org_id, if such org exists and can be accessed by the authenticated actor.
-spec get_active_organization(ctx:ctx()) -> {ok, openapi_organization_read:openapi_organization_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_active_organization(Ctx) ->
    get_active_organization(Ctx, #{}).

-spec get_active_organization(ctx:ctx(), maps:map()) -> {ok, openapi_organization_read:openapi_organization_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_active_organization(Ctx, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = [<<"/v2/orgs/active/org">>],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Get Organization
%% Gets a single organization (Permit.io account) matching the given org_id, if such org exists and can be accessed by the authenticated actor.
-spec get_organization(ctx:ctx(), binary()) -> {ok, openapi_organization_read:openapi_organization_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_organization(Ctx, OrgId) ->
    get_organization(Ctx, OrgId, #{}).

-spec get_organization(ctx:ctx(), binary(), maps:map()) -> {ok, openapi_organization_read:openapi_organization_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_organization(Ctx, OrgId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = [<<"/v2/orgs/", OrgId, "">>],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Invite Members To Organization
%% Invite new members into the organization.
-spec invite_members_to_organization(ctx:ctx(), binary(), list()) -> {ok, openapi_multi_invite_result:openapi_multi_invite_result(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
invite_members_to_organization(Ctx, OrgId, OpenapiInviteCreateArray) ->
    invite_members_to_organization(Ctx, OrgId, OpenapiInviteCreateArray, #{}).

-spec invite_members_to_organization(ctx:ctx(), binary(), list(), maps:map()) -> {ok, openapi_multi_invite_result:openapi_multi_invite_result(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
invite_members_to_organization(Ctx, OrgId, OpenapiInviteCreateArray, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = post,
    Path = [<<"/v2/orgs/", OrgId, "/invites">>],
    QS = lists:flatten([])++openapi_utils:optional_params(['inviter_name', 'inviter_email'], _OptionalParams),
    Headers = [],
    Body1 = OpenapiInviteCreateArray,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc List Organization Invites
%% Lists pending organization invites
-spec list_organization_invites(ctx:ctx(), binary()) -> {ok, [openapi_invite_read:openapi_invite_read()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
list_organization_invites(Ctx, OrgId) ->
    list_organization_invites(Ctx, OrgId, #{}).

-spec list_organization_invites(ctx:ctx(), binary(), maps:map()) -> {ok, [openapi_invite_read:openapi_invite_read()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
list_organization_invites(Ctx, OrgId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = [<<"/v2/orgs/", OrgId, "/invites">>],
    QS = lists:flatten([])++openapi_utils:optional_params(['page', 'per_page'], _OptionalParams),
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc List Organizations
%% Lists all the organizations that can be accessed by the authenticated actor (i.e: human team member or api key).
-spec list_organizations(ctx:ctx()) -> {ok, [openapi_organization_read:openapi_organization_read()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
list_organizations(Ctx) ->
    list_organizations(Ctx, #{}).

-spec list_organizations(ctx:ctx(), maps:map()) -> {ok, [openapi_organization_read:openapi_organization_read()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
list_organizations(Ctx, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = [<<"/v2/orgs">>],
    QS = lists:flatten([])++openapi_utils:optional_params(['page', 'per_page'], _OptionalParams),
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Update Organization
%% Updates the organization's profile.
-spec update_organization(ctx:ctx(), binary(), openapi_organization_update:openapi_organization_update()) -> {ok, openapi_organization_read:openapi_organization_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
update_organization(Ctx, OrgId, OpenapiOrganizationUpdate) ->
    update_organization(Ctx, OrgId, OpenapiOrganizationUpdate, #{}).

-spec update_organization(ctx:ctx(), binary(), openapi_organization_update:openapi_organization_update(), maps:map()) -> {ok, openapi_organization_read:openapi_organization_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
update_organization(Ctx, OrgId, OpenapiOrganizationUpdate, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = patch,
    Path = [<<"/v2/orgs/", OrgId, "">>],
    QS = [],
    Headers = [],
    Body1 = OpenapiOrganizationUpdate,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).


