<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DesktopNavigation.ascx.cs" Inherits="VivoShop.customControls.Navigation.DesktopNavigation" %>
<%@ Register Src="~/customControls/Navigation/Desktop/NavPanelIndicators.ascx" TagName="NavPanelIndicators" TagPrefix="Vivo" %>
<%@ Register Src="~/customControls/Navigation/Desktop/HorizontalMenu.ascx" TagName="HorizontalMenu" TagPrefix="Vivo" %>
<%@ Register Src="~/customControls/Navigation/Desktop/NavigationRootItem.ascx" TagName="NavigationRootItem" TagPrefix="Vivo" %>

<div class="site-header__nav-panel">
    <!-- data-sticky-mode - one of [pullToShow, alwaysOnTop] -->
    <div class="nav-panel nav-panel--sticky" data-sticky-mode="pullToShow">
        <div class="nav-panel__container container-fluid">
            <div class="nav-panel__row">
                <div id="divDepartmentsNav" runat="server" class="nav-panel__departments" visible="false">
                    <!-- .departments -->
                    <div id="divDepartments" runat="server" data-departments-fixed-by=".block-slideshow">
                        <div class="departments__body">
                            <div class="departments__links-wrapper">
                                <div class="departments__submenus-container"></div>
                                <asp:Repeater ID="rptMainCategories" runat="server">
                                    <HeaderTemplate>
                                        <ul class="departments__links">
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <Vivo:NavigationRootItem runat="server" Category='<%#Container.DataItem %>'></Vivo:NavigationRootItem>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        </ul>
                                    </FooterTemplate>
                                </asp:Repeater>
                            </div>
                        </div>

                        <button class="departments__button">
                            <svg class="departments__button-icon" width="18px" height="14px">
                                <use xlink:href="/images/sprite.svg#menu-18x14"></use>
                            </svg>
                            <!--Shop By Category-->
                            Kategorije
                                            <svg class="departments__button-arrow" width="9px" height="6px">
                                                <use xlink:href="/images/sprite.svg#arrow-rounded-down-9x6"></use>
                                            </svg>
                        </button>
                    </div>
                </div>

                <%--Horizontal Menu --%>
                <Vivo:HorizontalMenu runat="server" ID="HorizontalMenu" Visible="false"></Vivo:HorizontalMenu>

                <%--NavPanel Indicators--%>
                <%--<Vivo:NavPanelIndicators runat="server"></Vivo:NavPanelIndicators>--%>

            </div>
        </div>
    </div>
</div>
