<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HorizontalMenu.ascx.cs" Inherits="VivoShop.customControls.Navigation.HorizontalMenu" %>
<div class="nav-panel__nav-links nav-links">
    <asp:Repeater ID="rptHorizontalMenu" runat="server">
        <HeaderTemplate>
            <ul class="nav-links__list">
        </HeaderTemplate>
        <ItemTemplate>
            <li class="nav-links__item  nav-links__item--has-submenu ">
                <a class="nav-links__item-link" href="index.html">
                    <div class="nav-links__item-body">
                        <!--Link-->
                    </div>
                </a>
            </li>
        </ItemTemplate>
        <FooterTemplate>
            </ul>
        </FooterTemplate>
    </asp:Repeater>
</div>
