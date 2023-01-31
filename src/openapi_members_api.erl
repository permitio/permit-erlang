-module(openapi_members_api).

-export([delete_organization_member/2, delete_organization_member/3,
         get_authenticated_member/1, get_authenticated_member/2,
         get_organization_member/2, get_organization_member/3,
         list_organization_members/1, list_organization_members/2,
         update_organization_member/3, update_organization_member/4]).

-define(BASE_URL, <<"">>).

%% @doc Delete Organization Member
%% Deletes an account member matching the given id or email address. The member will be removed from the active account in permit.io.  If the member is the only member in its account (organization), returns 400 (bad request), due to nobody remains with access to the account, meaning deletion of the entire account (org). To completely remove an account, call DELETE `/orgs/{org}`.
-spec delete_organization_member(ctx:ctx(), binary()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
delete_organization_member(Ctx, MemberId) ->
    delete_organization_member(Ctx, MemberId, #{}).

-spec delete_organization_member(ctx:ctx(), binary(), maps:map()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
delete_organization_member(Ctx, MemberId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = delete,
    Path = [<<"/v2/members/", MemberId, "">>],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Get the authenticated account member
%% Gets the authenticated account member's details.
-spec get_authenticated_member(ctx:ctx()) -> {ok, openapi_org_member_read:openapi_org_member_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_authenticated_member(Ctx) ->
    get_authenticated_member(Ctx, #{}).

-spec get_authenticated_member(ctx:ctx(), maps:map()) -> {ok, openapi_org_member_read:openapi_org_member_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_authenticated_member(Ctx, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = [<<"/v2/members/me">>],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Get Organization Member
%% Gets a single account member by its id or email address. matching the given member, if no such member exists under the current active account (organization), returns 404.
-spec get_organization_member(ctx:ctx(), binary()) -> {ok, openapi_org_member_read:openapi_org_member_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_organization_member(Ctx, MemberId) ->
    get_organization_member(Ctx, MemberId, #{}).

-spec get_organization_member(ctx:ctx(), binary(), maps:map()) -> {ok, openapi_org_member_read:openapi_org_member_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_organization_member(Ctx, MemberId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = [<<"/v2/members/", MemberId, "">>],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc List Organization Members
%% Lists all the account members that have access to the current active account. The active account/organization is determined by the API Key used or by the authenticated session id.
-spec list_organization_members(ctx:ctx()) -> {ok, [openapi_org_member_read:openapi_org_member_read()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
list_organization_members(Ctx) ->
    list_organization_members(Ctx, #{}).

-spec list_organization_members(ctx:ctx(), maps:map()) -> {ok, [openapi_org_member_read:openapi_org_member_read()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
list_organization_members(Ctx, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = [<<"/v2/members">>],
    QS = lists:flatten([])++openapi_utils:optional_params(['page', 'per_page'], _OptionalParams),
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Update Organization Member
%% Updates an account member's settings.
-spec update_organization_member(ctx:ctx(), binary(), openapi_org_member_update:openapi_org_member_update()) -> {ok, openapi_org_member_read:openapi_org_member_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
update_organization_member(Ctx, MemberId, OpenapiOrgMemberUpdate) ->
    update_organization_member(Ctx, MemberId, OpenapiOrgMemberUpdate, #{}).

-spec update_organization_member(ctx:ctx(), binary(), openapi_org_member_update:openapi_org_member_update(), maps:map()) -> {ok, openapi_org_member_read:openapi_org_member_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
update_organization_member(Ctx, MemberId, OpenapiOrgMemberUpdate, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = patch,
    Path = [<<"/v2/members/", MemberId, "">>],
    QS = [],
    Headers = [],
    Body1 = OpenapiOrgMemberUpdate,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).


