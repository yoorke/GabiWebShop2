<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WidgetFiltersBrandItem.ascx.cs" Inherits="VivoShop.customControls.BlockSidebarControls.WidgetFiltersBrandsItem" %>
<label class="filter-list__item">
    <span class="filter-list__input input-check">
        <span class="input-check__body">
            <input class="input-check__input" type="checkbox" />
            <span class="input-check__box"></span>
            <svg class="input-check__icon" width="9px" height="7px">
                <use xlink:href="/images/sprite.svg#check-9x7"></use>
            </svg>
        </span>
    </span>
    <span class="filter-list__title">
        <asp:Label ID="lblBrandName" runat="server"></asp:Label>
    </span>
    <span class="filter-list__counter">
        <asp:Label ID="lblProductsCount" runat="server"></asp:Label>
    </span>
</label>