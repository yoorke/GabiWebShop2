<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NavigationRootItem.ascx.cs" Inherits="VivoShop.customControls.Navigation.NavigationRootItem" %>
<%@ Register Src="~/customControls/Navigation/Desktop/NavigationItemColumn.ascx" TagName="NavigationItemColumn" TagPrefix="Vivo" %>
<li class="departments__item">
    <a class="departments__item-link" href="">
        <asp:Literal ID="lblCategoryName" runat="server"></asp:Literal>
        <svg class="departments__item-arrow" width="6px" height="9px">
            <use xlink:href="/images/sprite.svg#arrow-rounded-right-6x9"></use>
        </svg>
    </a>

    <%--SubMenu--%>
    <div class="departments__submenu departments__submenu--type--megamenu departments__submenu--size--xl">
        <!-- .megamenu -->
        <div class="megamenu  megamenu--departments ">
            <div ID="divMegenuBody" runat="server" class="megamenu__body"> <%--style="background-image: url('images/megamenu/megamenu-1.jpg');">--%>
                <div class="row">

                    <Vivo:NavigationItemColumn ID="NICColumn1" runat="server"></Vivo:NavigationItemColumn>

                    <Vivo:NavigationItemColumn ID="NICColumn2" runat="server"></Vivo:NavigationItemColumn>

                    <Vivo:NavigationItemColumn ID="NICColumn3" runat="server"></Vivo:NavigationItemColumn>

                    <Vivo:NavigationItemColumn ID="NICColumn4" runat="server"></Vivo:NavigationItemColumn>

                    <%--Col2--%>
                    <%--<div class="col-3">
                        <asp:Repeater ID="rptSubCategoriesLevel2Col2" runat="server">
                            <HeaderTemplate>
                                <ul class="megamenu__links megamenu__links--level--0">
                            </HeaderTemplate>
                            <ItemTemplate>
                                <li class="megamenu__item  megamenu__item--with-submenu ">
                                    <a href="">Boje</a>
                                </li>
                                <asp:Repeater ID="rptSubCategoriesLevel3Col2" runat="server">
                                    <HeaderTemplate>
                                        <ul class="megamenu__links megamenu__links--level--1">
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <li class="megamenu__item">
                                            <a href="shop-grid-3-columns-sidebar.html">Unutrašnje boje
                                            </a>

                                        </li>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        </ul>
                                    </FooterTemplate>
                                </asp:Repeater>
                            </ItemTemplate>
                            <FooterTemplate>
                            </FooterTemplate>
                        </asp:Repeater>
                    </div>--%>

                    <%--Col3--%>
                    <%--<div class="col-3">
                        <asp:Repeater ID="rptSubCategoriesLevel2Col3" runat="server">
                            <HeaderTemplate>
                                <ul class="megamenu__links megamenu__links--level--0">
                            </HeaderTemplate>
                            <ItemTemplate>
                                <li class="megamenu__item  megamenu__item--with-submenu ">
                                    <a href="">Boje</a>
                                </li>
                                <asp:Repeater ID="rptSubCategoriesLevel3Col3" runat="server">
                                    <HeaderTemplate>
                                        <ul class="megamenu__links megamenu__links--level--1">
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <li class="megamenu__item">
                                            <a href="shop-grid-3-columns-sidebar.html">Unutrašnje boje
                                            </a>

                                        </li>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        </ul>
                                    </FooterTemplate>
                                </asp:Repeater>
                            </ItemTemplate>
                            <FooterTemplate>
                            </FooterTemplate>
                        </asp:Repeater>
                    </div>--%>

                    <%--Col4--%>
                    <%--<div class="col-3">
                        <asp:Repeater ID="rptSubCategoriesLevel2Col4" runat="server">
                            <HeaderTemplate>
                                <ul class="megamenu__links megamenu__links--level--0">
                            </HeaderTemplate>
                            <ItemTemplate>
                                <li class="megamenu__item  megamenu__item--with-submenu ">
                                    <a href="">Boje</a>
                                </li>
                                <asp:Repeater ID="rptSubCategoriesLevel3Col4" runat="server">
                                    <HeaderTemplate>
                                        <ul class="megamenu__links megamenu__links--level--1">
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <li class="megamenu__item">
                                            <a href="shop-grid-3-columns-sidebar.html">Unutrašnje boje
                                            </a>

                                        </li>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        </ul>
                                    </FooterTemplate>
                                </asp:Repeater>
                            </ItemTemplate>
                            <FooterTemplate>
                            </FooterTemplate>
                        </asp:Repeater>
                    </div>--%>

                </div>
            </div>
        </div>
    </div>
</li>
