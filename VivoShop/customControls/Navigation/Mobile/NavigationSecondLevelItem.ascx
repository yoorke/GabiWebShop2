<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NavigationSecondLevelItem.ascx.cs" Inherits="VivoShop.customControls.Navigation.Mobile.NavigationSecondLevelItem" %>
<%@ Register Src="~/customControls/Navigation/Mobile/NavigationThirdLevelItem.ascx" TagName="NavigationThirdLevelItem" TagPrefix="Vivo" %>

<li class="mobile-links__item" data-collapse-item>
    <div class="mobile-links__item-title">
        <%--<a href="index.html" class="mobile-links__item-link">Home 1</a>--%>

        <asp:HyperLink ID="lnkCategory" runat="server" CssClass="mobile-links__item-link"></asp:HyperLink>

        <button class="mobile-links__item-toggle" type="button" data-collapse-trigger>
            <svg class="mobile-links__item-arrow" width="12px" height="7px">
                <use xlink:href="/images/sprite.svg#arrow-rounded-down-12x7"></use>
            </svg>
        </button>
    </div>

    <div class="mobile-links__item-sub-links" data-collapse-content>
        <asp:Repeater ID="rptMenu" runat="server">
            <HeaderTemplate>
                <ul class="mobile-links mobile-links--level--2">
            </HeaderTemplate>
            <ItemTemplate>
                <Vivo:NavigationThirdLevelItem runat="server" Category="<%#Container.DataItem %>"></Vivo:NavigationThirdLevelItem>
            </ItemTemplate>
            <FooterTemplate>
                </ul>
            </FooterTemplate>
        </asp:Repeater>
    </div>
</li>
