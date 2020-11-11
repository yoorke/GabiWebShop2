<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DesktopHeader.ascx.cs" Inherits="VivoShop.customControls.DesktopHeader" %>
<%@ Register Src="~/customControls/Header/Desktop/TopBar.ascx" TagName="TopBar" TagPrefix="Vivo" %>
<%@ Register Src="~/customControls/Header/Desktop/HeaderMiddleContainer.ascx" TagName="HeaderMiddleContainer" TagPrefix="Vivo" %>
<%@ Register Src="~/customControls/Navigation/Desktop/DesktopNavigation.ascx" TagName="DesktopNavigation" TagPrefix="Vivo" %>

<header class="site__header d-lg-block d-none">
    <div class="site-header">

        <Vivo:TopBar runat="server"></Vivo:TopBar>
        <Vivo:HeaderMiddleContainer runat="server"></Vivo:HeaderMiddleContainer>
        <Vivo:DesktopNavigation ID="desktopNavigation" runat="server"></Vivo:DesktopNavigation>

    </div>
</header>