"use client";

import { CopilotKit } from "@copilotkit/react-core";
import { MsalAuthProvider } from "@/components/MsalAuthProvider";

export function Providers({ children }: { children: React.ReactNode }) {
  return (
    <MsalAuthProvider>
      <CopilotKit runtimeUrl="/api/copilotkit" agent="my_agent">
        {children}
      </CopilotKit>
    </MsalAuthProvider>
  );
}
