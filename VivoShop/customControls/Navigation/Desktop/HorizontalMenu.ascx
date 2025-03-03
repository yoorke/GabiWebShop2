<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HorizontalMenu.ascx.cs" Inherits="VivoShop.customControls.Navigation.HorizontalMenu" %>
<%@ Register Src="~/customControls/Navigation/Desktop/HorizontalMenuSecondLevel.ascx" TagName="HorizontalMenuSecondLevel" TagPrefix="Vivo" %>

<div class="nav-panel__nav-links nav-links">
    <asp:Repeater ID="rptHorizontalMenu" runat="server">
        <HeaderTemplate>
            <ul class="nav-links__list">
        </HeaderTemplate>
        <ItemTemplate>
            <li class="nav-links__item  nav-links__item--has-submenu ">
                <%--<a class="nav-links__item-link" href="index.html">
                    <div class="nav-links__item-body">
                        <!--Link-->
                    </div>
                </a>--%>
                <a href="" class="nav-links__item-link">
                    <div class="nav-links__item-body">
                        <asp:Literal runat="server" Text='<%#Eval("Name") %>'></asp:Literal>
                        <svg class="nav-links__item-arrow" width="9px" height="6px">
                            <use xlink:href="/images/sprite.svg#arrow-rounded-down-9x6"></use>
                        </svg>
                    </div>
                </a>
                <div class="nav-links__submenu nav-links__submenu--type--megamenu nav-links__submenu--size--nl">
                    <div class="megamenu">
                        <div class="megamenu__body">
                            <Vivo:HorizontalMenuSecondLevel runat="server" Category='<%#Container.DataItem %>'></Vivo:HorizontalMenuSecondLevel>
                        </div>
                    </div>
                </div>
            </li>
        </ItemTemplate>
        <FooterTemplate>
            </ul>
        </FooterTemplate>
    </asp:Repeater>
</div>
