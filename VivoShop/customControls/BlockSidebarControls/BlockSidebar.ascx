<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BlockSidebar.ascx.cs" Inherits="VivoShop.customControls.BlockSidebarControls.BlockSidebar" %>
<%@ Register Src="~/customControls/BlockSidebarControls/WidgetFiltersBrandsItem.ascx" TagName="WidgetBrandItem" TagPrefix="Vivo" %>
<%@ Register Src="~/customControls/BlockSidebarControls/WidgetFiltersAttributesItem.ascx" TagName="WidgetFiltersAttributesItem" TagPrefix="Vivo" %>

<%--<div class="shop-layout__sidebar">--%>
    <div class="block block-sidebar block-sidebar--offcanvas--mobile">
        <div class="block-sidebar__backdrop"></div>
        <div class="block-sidebar__body">
            <div class="block-sidebar__header">
                <div class="block-sidebar__title">Filter</div>
                <button class="block-sidebar__close" type="button">
                    <svg width="20px" height="20px">
                        <use xlink:href="/images/sprite.svg#cross-20"></use>
                    </svg>
                </button>
            </div>
            <div class="block-sidebar__item">
                <div class="widget-filters widget widget-filters--offcanvas--mobile" data-collapse data-collapse-opened-class="filter--opened">
                    <h4 class="widget-filters__title widget__title">Filteri</h4>
                    <div class="widget-filters__list">

                        <div class="widget-filters__item">
                            <div class="filter filter--opened" data-collapse-item>
                                <button type="button" class="filter__title" data-collapse-trigger>
                                    Proizvođač
                                    <svg class="filter__arrow" width="12px" height="7px">
                                        <use xlink:href="/images/sprite.svg#arrow-rounded-down-12x7"></use>
                                    </svg>
                                </button>
                                <div class="filter__body" data-collapse-content>
                                    <div class="filter__container">
                                        <div class="filter-list">
                                            <div class="filter-list__list">
                                                <asp:Repeater ID="rptBrands" runat="server">
                                                    <ItemTemplate>
                                                        <Vivo:WidgetBrandItem runat="server" Brand='<%#Container.DataItem %>' />
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div ID="spanFilter" runat="server" visible="false" class="block-sidebar__item d-none d-lg-block">
                <div class="widget-filters widget widget-filters--offcanvas--mobile" data-collapse data-collapse-opened-class="filter--opened">
                    <div class="widget-filters__list">
                        <asp:Repeater ID="rptFilter" runat="server">
                            <ItemTemplate>
                                <Vivo:WidgetFiltersAttributesItem ID="rptFilter" runat="server" Attribute='<%#Container.DataItem %>'></Vivo:WidgetFiltersAttributesItem>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
        </div>
    </div>
<%--</div>--%>
