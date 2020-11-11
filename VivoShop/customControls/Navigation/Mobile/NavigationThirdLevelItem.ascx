<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NavigationThirdLevelItem.ascx.cs" Inherits="VivoShop.customControls.Navigation.Mobile.NavigationThirdLevelItem" %>
<li class="mobile-links__item" data-collapse-item>
    <div class="mobile-links__item-title">
        <%--<a href="" class="mobile-links__item-link">Engravers</a>--%>
        <asp:HyperLink ID="lnkCategory" runat="server" CssClass="mobile-links__item-link"></asp:HyperLink>
    </div>
</li>
