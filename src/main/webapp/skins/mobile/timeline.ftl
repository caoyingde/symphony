<#include "macro-head.ftl">
<!DOCTYPE html>
<html>
    <head>
        <@head title="${timelineLabel} - ${symphonyLabel}">
        <meta name="description" content="${timelineLabel}"/>
        </@head>
    </head>
    <body>
        <#include "header.ftl">
        <div class="main">
            <div class="content fn-clear">
                <div class="domains fn-clear">
                    <#list domains as navDomain>
                    <a href="/domain/${navDomain.domainURI}">${navDomain.domainTitle}</a>
                    <#if 10 < navDomain?counter>
                    <#break>
                    </#if>
                    </#list>
                    <a href="/">${hotLabel}</a>
                    <a href="/recent">${latestLabel}</a>
                    <#if isLoggedIn && "" != currentUser.userCity>
                    <a href="/city/my">${currentUser.userCity}</a>
                    </#if>
                    <a href="/timeline" class="selected">${timelineLabel}</a>
                </div>

                <#if timelines?size <= 0>
                <div id="emptyTimeline">${emptyTimelineLabel}</div>
                </#if>
                <div class="list single-line">
                    <ul id="ul">
                        <#list timelines as timeline>
                        <li>${timeline.content}</li>
                        </#list>
                    </ul>
                </div>
            </div>
            <div class="fn-hr10"></div>
            <div class="side wrapper">
                <#include "side.ftl">
            </div>
        </div>
        <#include "footer.ftl">

        <script type="text/javascript" src="${staticServePath}/js/lib/ws-flash/swfobject.js"></script>
        <script type="text/javascript" src="${staticServePath}/js/lib/ws-flash/web_socket.js"></script>
        <script type="text/javascript" src="${staticServePath}/js/lib/reconnecting-websocket.min.js"></script>
        <script type="text/javascript" src="${staticServePath}/js/channel${miniPostfix}.js?${staticResourceVersion}"></script>
        <script>
            WEB_SOCKET_SWF_LOCATION = "${staticServePath}/js/lib/ws-flash/WebSocketMain.swf";

            // Init [Timeline] channel
            TimelineChannel.init("${wsScheme}://${serverHost}:${serverPort}/timeline-channel");

            var timelineCnt = ${timelineCnt};
        </script>
    </body>
</html>
