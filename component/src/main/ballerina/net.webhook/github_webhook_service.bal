package ballerina.net.webhook;

public struct GitHubWebhook {
}

function <GitHubWebhook s> getEndpoint () returns (GitHubWebhookEndpoint) {
    GitHubWebhookEndpoint ep = {};
    return ep;
}
