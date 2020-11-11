<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MobileNavigation.ascx.cs" Inherits="VivoShop.customControls.Navigation.Mobile.MobileNavigation" %>
<%@ Register Src="~/customControls/Navigation/Mobile/NavigationRootItem.ascx" TagName="NavigationRootItem" TagPrefix="Vivo" %>

<div class="mobilemenu">
        <div class="mobilemenu__backdrop"></div>
        <div class="mobilemenu__body">
            <div class="mobilemenu__header">
                <div class="mobilemenu__title">Menu</div>
                <button type="button" class="mobilemenu__close">
                    <svg width="20px" height="20px">
                        <use xlink:href="/images/sprite.svg#cross-20"></use>
                    </svg>
                </button>
            </div>
            <div class="mobilemenu__content">

                <asp:Repeater ID="rptRootMenu" runat="server">
                    <HeaderTemplate>
                        <ul class="mobile-links mobile-links--level--0" data-collapse data-collapse-opened-class="mobile-links__item--open">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <Vivo:NavigationRootItem runat="server" Category="<%#Container.DataItem %>"></Vivo:NavigationRootItem>
                    </ItemTemplate>
                    <FooterTemplate>
                        </ul>
                    </FooterTemplate>
                </asp:Repeater>

            </div>
        </div>
</div>