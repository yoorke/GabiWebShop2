<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Breadcrumb.ascx.cs" Inherits="VivoShop.customControls.PageHeaderControls.Breadcrumb" %>
<div class="page-header__breadcrumb">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <asp:SiteMapPath runat="server"></asp:SiteMapPath>
        </ol>
    </nav>
</div>