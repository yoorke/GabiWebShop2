<%@ Page Title="" Language="C#" MasterPageFile="~/VivoShop.Master" AutoEventWireup="true" CodeBehind="cenovnikDostave.aspx.cs" Inherits="VivoShop.cenovnikDostave" %>
<%@ Register Src="~/customControls/Header/Desktop/DesktopHeader.ascx" TagName="DesktopHeader" TagPrefix="Vivo" %>
<%@ Register Src="~/customControls/PageHeaderControls/PageHeader.ascx" TagName="PageHeader" TagPrefix="Vivo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <Vivo:DesktopHeader runat="server" IsHomepage="false" />

    <div class="site__body">
        <Vivo:PageHeader ID="pageHeader" runat="server" Title="Cenovnik dostave" />
        <div class="block">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <p>
                            Dostava se vrši kurirskom službom AKS.
                        </p>
                        <p>
                            Za sve pošiljke čija vrednost ne prelazi <strong><asp:Literal ID="lblFreeDeliveryTotalValue" runat="server"></asp:Literal></strong> dinara
                            naplaćuje se dostava na osnovu težine po sledećoj tabeli.
                        </p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-8 offset-2">
                        <asp:Repeater ID="rptDeliveryPrices" runat="server">
                            <HeaderTemplate>
                                <table class="table table-sm table-hover table-striped table-bordered">
                                    <thead>
                                        <th>Težina</th>
                                        <th>Cena</th>
                                    </thead>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td><small>od</small> <asp:Literal runat="server" Text='<%#Eval("range_from") %>'></asp:Literal> <small>kg do</small> <asp:Literal runat="server" Text='<%#Eval("range_to") %>'></asp:Literal><small> kg</small></td>
                                    <td class="text-right"><asp:Literal runat="server" Text='<%#Eval("price") %>'></asp:Literal> <small>din</small></td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                </table>
                            </FooterTemplate>
                        </asp:Repeater>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <p class="small">Cene su izražene sa PDV-om.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterContentPlaceholder" runat="server">
</asp:Content>
