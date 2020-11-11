<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PageHeader.ascx.cs" Inherits="VivoShop.customControls.PageHeaderControls.PageHeader" %>
<%@ Register Src="~/customControls/PageHeaderControls/Breadcrumb.ascx" TagName="Breadcrumb" TagPrefix="Vivo" %>

<div class="page-header">
    <div class="page-header__container container">

        <Vivo:Breadcrumb runat="server"></Vivo:Breadcrumb>

        <div id="pageHeaderDiv" runat="server" class="page-header__title">
            <h1><asp:Literal ID="lblTitle" runat="server"></asp:Literal></h1>
        </div>

    </div>
</div>