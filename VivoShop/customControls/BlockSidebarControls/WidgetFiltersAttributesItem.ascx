<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WidgetFiltersAttributesItem.ascx.cs" Inherits="VivoShop.customControls.BlockSidebarControls.WidgetFiltersAttributesItem" %>
<div class="widget-filters__item">
    <div class="filter filter--opened" data-collapse-item>
        <button type="button" class="filter__title" data-collapse-trigger>
            <asp:Literal ID="lblTitle" runat="server"></asp:Literal>
            <svg class="filter__arrow" width="12px" height="7px">
                <use xlink:href="/images/sprite.svg#arrow-rounded-down-12x7"></use>
            </svg>
        </button>
        <div class="filter__body" data-collapse-content>
            <div class="filter__container">
                <div class="filter__list">
                    <div class="filter-list__list">
                        <asp:Repeater ID="rptAttributeValues" runat="server" OnItemDataBound="rptAttributeValues_ItemDataBound">
                            <ItemTemplate>
                                <label class="filter-list__item">
                                    <span class="filter-list__input input-check">
                                        <span ID="attributeSpan" runat="server" class="input-check__body">
                                            <input ID="chkAttributeValueID" runat="server" class="input-check__input" type="checkbox" onchange="createQueryString()" />
                                            <span class="input-check__box"></span>
                                            <svg class="input-check__icon" width="9px" height="7px">
                                                <use xlink:href="/images/sprite.svg#check-9x7"></use>
                                            </svg>
                                        </span>
                                    </span>
                                    <span class="filter-list__title">
                                        <asp:Literal ID="lblValue" runat="server" Text='<%#Eval("value") %>'></asp:Literal>
                                        <asp:HiddenField ID="lblAttributeValueID" runat="server" Value='<%#Eval("attributeValueID") %>' />
                                        <asp:HiddenField ID="lblAttributeID" runat="server" Value='<%#Eval("attributeID") %>' />
                                    </span>
                                    <span class="filter-list__counter">
                                        <asp:Literal runat="server" Text='<%#Eval("count") %>'></asp:Literal>
                                    </span>
                                </label>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>