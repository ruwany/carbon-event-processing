<%--
  ~ Copyright (c) 2015, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
  ~
  ~ Licensed under the Apache License, Version 2.0 (the "License");
  ~ you may not use this file except in compliance with the License.
  ~ You may obtain a copy of the License at
  ~
  ~     http://www.apache.org/licenses/LICENSE-2.0
  ~
  ~ Unless required by applicable law or agreed to in writing, software
  ~ distributed under the License is distributed on an "AS IS" BASIS,
  ~ WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  ~ See the License for the specific language governing permissions and
  ~ limitations under the License.
  --%>
<%@ page import="org.wso2.carbon.event.processor.stub.EventProcessorAdminServiceStub" %>
<%@ page import="org.wso2.carbon.event.processor.ui.EventProcessorUIUtils" %>
<%
    EventProcessorAdminServiceStub stub = EventProcessorUIUtils.getEventProcessorAdminService(config, session, request);
    String executionPlanName = request.getParameter("execPlanName");
    String executionPlanPath = request.getParameter("execPlanPath");
    String executionPlan = request.getParameter("execPlan");
    String msg = null;
    if (executionPlanName != null) {
        try {
            stub.editActiveExecutionPlan(executionPlan, executionPlanName);
            msg = "true";
        } catch (Exception e) {
            msg = e.getMessage();

        }
    } else if (executionPlanPath != null) {
        try {
            // assuming file to be not yet deployed.
            stub.editInactiveExecutionPlan(executionPlan, executionPlanPath);
            msg = "true";
        } catch (Exception e) {
            msg = e.getMessage();

        }
    }

%><%=msg%><%
%>
