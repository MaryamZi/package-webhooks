package ballerina.net.webhook.github;

public struct GitHubWebhook {
}

function <GitHubWebhook s> getEndpoint () returns (GitHubWebhookEndpoint) {
    GitHubWebhookEndpoint ep = {};
    return ep;
}
