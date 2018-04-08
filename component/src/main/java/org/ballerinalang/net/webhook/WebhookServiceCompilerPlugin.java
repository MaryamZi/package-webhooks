package org.ballerinalang.net.webhook;

import org.ballerinalang.compiler.plugins.AbstractCompilerPlugin;
import org.ballerinalang.compiler.plugins.SupportEndpointTypes;
import org.ballerinalang.util.diagnostic.DiagnosticLog;

/**
 * Compiler Plugin for GitHub Webhooks.
 */
@SupportEndpointTypes(
        value = {@SupportEndpointTypes.EndpointType(packageName = "ballerina.webhook",
                name = "GitHubListener")
        }
)
public class WebhookServiceCompilerPlugin extends AbstractCompilerPlugin {
    @Override
    public void init(DiagnosticLog diagnosticLog) {

    }
}
