package ballerina.webhook;

public type GitHubService object {

    public function getEndpoint() returns (GitHubListener) {
        GitHubListener ep = new;
        return ep;
    }

};
