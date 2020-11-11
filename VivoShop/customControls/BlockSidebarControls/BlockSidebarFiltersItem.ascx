<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BlockSidebarFiltersItem.ascx.cs" Inherits="VivoShop.customControls.BlockSidebarControls.BlockSidebarFiltersItem" %>
<%@ Register Src="~/customControls/BlockSidebarControls/WidgetFiltersAttributesItem.ascx" TagName="WidgetFiltersAttributeItem" TagPrefix="Vivo" %>

<div class="block-sidebar__item">
    <div class="widget-filters widget widget-filters--offcanvas--mobile" data-collapse data-collapse-opened-class="filter--opened">
        <h4 class="widget-filters__title widget__title">Filter</h4>
        <div class="widget-filters__list">
            <asp:Repeater ID="rptAttributes" runat="server">
                <ItemTemplate>
                    <Vivo:WidgetFiltersAttributeItem runat="server"></Vivo:WidgetFiltersAttributeItem>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</div>