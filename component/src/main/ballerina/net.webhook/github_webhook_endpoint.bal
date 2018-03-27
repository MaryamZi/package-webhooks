package ballerina.net.webhook;

import ballerina/net.http;
import ballerina/net.websub;

///////////////////////////////////////////////////////////
/// GitHub Webhook (WebSub Subscriber Service Endpoint) ///
///////////////////////////////////////////////////////////
@Description {value:"Struct representing the GitHub Webhook (WebSub Subscriber Service) Endpoint"}
@Field {value:"config: The configuration for the endpoint"}
@Field {value:"serviceEndpoint: The underlying HTTP service endpoint"}
public struct GitHubWebhookEndpoint {
    GitHubWebhookEndpointConfiguration config;
    websub:SubscriberServiceEndpoint subscriberServiceEndpoint;
}

public struct GitHubWebhookEndpointConfiguration {
    string host;
    int port;
}

public function <GitHubWebhookEndpoint ep> GitHubWebhookEndpoint() {
    ep.subscriberServiceEndpoint = {};
}

@Description {value:"Gets called when the endpoint is being initialized during package init"}
@Param {value:"config: The SubscriberServiceEndpointConfiguration of the endpoint"}
public function <GitHubWebhookEndpoint ep> init (GitHubWebhookEndpointConfiguration config) {
    ep.config = config;
    websub:SubscriberServiceEndpointConfiguration sseConfig = { host:config.host, port:config.port };
    sseConfig.topicHeader = "X-GitHub-Event";
    sseConfig.topicResourceMap = { "commit_comment" : "onCommitComment",
                                "create" : "onCreate",
                                "delete" : "onDelete",
                                "deployment" : "onDeployment",
                                "deployment_status" : "onDeploymentStatus",
                                "fork" : "onFork",
                                "gollum" : "onGollum",
                                "installation" : "onInstallation",
                                "installation_repositories" : "onInstallationRepositories",
                                "issue_comment" : "onIssueComment",
                                "issues" : "onIssues",
                                "label" : "onLabel",
                                "marketplace_purchase" : "onMarketplacePurchase",
                                "member" : "onMember",
                                "membership" : "onMembership",
                                "milestone" : "onMilestone",
                                "organization" : "onOrganization",
                                "org_block" : "onOrgBlock",
                                "page_build" : "onPageBuild",
                                "project_card" : "onProject_card",
                                "project_column" : "onProjectColumn",
                                "project" : "onProject",
                                "public" : "onPublic",
                                "pull_request" : "onPullRequest",
                                "pull_request_review" : "onPullRequestReview",
                                "pull_request_review_comment" : "onPullRequestReviewComment",
                                "push" : "onPush",
                                "release" : "onRelease",
                                "repository" : "onRepository",
                                "status" : "onStatus",
                                "team" : "onTeam",
                                "team_add" : "onTeamAdd",
                                "watch" : "onWatch"};
    ep.subscriberServiceEndpoint.init(sseConfig);
}

@Description {value:"Gets called whenever a service attaches itself to this endpoint and during package init"}
@Param {value:"serviceType: The service attached"}
public function <GitHubWebhookEndpoint ep> register (typedesc serviceType) {
    ep.subscriberServiceEndpoint.register(serviceType);
}

@Description {value:"Starts the registered service"}
public function <GitHubWebhookEndpoint ep> start () {
    ep.subscriberServiceEndpoint.start();
}

@Description {value:"Returns the connector that client code uses"}
@Return {value:"The connector that client code uses"}
public function <GitHubWebhookEndpoint ep> getClient () returns (http:Connection) {
    return ep.subscriberServiceEndpoint.getClient();
}

@Description {value:"Stops the registered service"}
public function <GitHubWebhookEndpoint ep> stop () {
    ep.subscriberServiceEndpoint.stop();
}
