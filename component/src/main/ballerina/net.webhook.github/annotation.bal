package ballerina.net.webhook.github;

///////////////////////////
/// Service Annotations ///
///////////////////////////
public struct GitHubWebhookConfiguration {
    GitHubWebhookEndpoint[] endpoints;
    string basePath;
    string secret;
}

public annotation <service> GitHubWebhookConfig GitHubWebhookConfiguration;
