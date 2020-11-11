<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NavigationRootItem.ascx.cs" Inherits="VivoShop.customControls.Navigation.Mobile.NavigationRootItem" %>
<%@ Register Src="~/customControls/Navigation/Mobile/NavigationSecondLevelItem.ascx" TagName="NavigationSecondLevelItem" TagPrefix="Vivo" %>

<li class="mobile-links__item" data-collapse-item>
    <div class="mobile-links__item-title">
        <%--<a href="index.html" class="mobile-links__item-link">
            Home
        </a>--%>
        <asp:HyperLink ID="lnkCategory" runat="server" CssClass="mobile-links__item-link"></asp:HyperLink>

        <button class="mobile-links__item-toggle" type="button" data-collapse-trigger>
            <svg class="mobile-links__item-arrow" width="12px" height="7px">
                <use xlink:href="/images/sprite.svg#arrow-rounded-down-12x7"></use>
            </svg>
        </button>
    </div>
    <div class="mobile-links__item-sub-links" data-collapse-content>
        <asp:Repeater ID="rptSubCategoriesLevel2" runat="server">
            <HeaderTemplate>
                <ul class="mobile-links mobile-links--level--1">
            </HeaderTemplate>
            <ItemTemplate>
                <Vivo:NavigationSecondLevelItem runat="server" Category="<%#Container.DataItem %>"></Vivo:NavigationSecondLevelItem>
            </ItemTemplate>
            <FooterTemplate>
                </ul>
            </FooterTemplate>
        </asp:Repeater>
    </div>
</li>
