﻿<%@ Page Title="" Language="C#" MasterPageFile="~/webshopAdmin/adminPanel.Master" AutoEventWireup="true" CodeBehind="unusedImagesSettings.aspx.cs" Inherits="WebShopAdmin.webshopAdmin.unusedImagesSettings" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper">
        <div class="row">
            <div class="col-md-12">
                <h1 class="page-header">Nekorišćene slike</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3">
                <div class="btn-group">
                    <asp:Button ID="btnRefresh" runat="server" Text="Osveži" OnClick="btnRefresh_Click" CssClass="btn btn-primary" />
                    <asp:Button ID="btnDeleteAll" runat="server" Text="Obriši sve" OnClick="btnDeleteAll_Click" CssClass="btn btn-primary" />
                </div>
            </div>
            <div class="col-md-3">
                <asp:CheckBox ID="chkShowImages" runat="server" Text="Prikaži slike" CssClass="checkbox" />
            </div>
        </div>
        <div class="row margin-top-2">
            <div class="col-md-3">
                Ukupno nekorišćenih slika: <asp:Label ID="lblImagesCount" runat="server"></asp:Label>
            </div>
            <div class="col-md-3">
                Ukupno MB: <asp:Label ID="lblImagesSize" runat="server"></asp:Label>
            </div>
        </div>
        <div class="row margin-top-2">
            <div class="col-md-12">
                <div class="table-responsive">
                    <asp:GridView ID="dgvImages" runat="server" AutoGenerateColumns="false" CssClass="table table-condensed table-bordered table-hover table-striped"
                        OnRowDeleting="dgvImages_RowDeleting" DataKeyNames="imageID">
                        <Columns>
                            <asp:TemplateField HeaderText="ImageID" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblImageID" runat="server" Text='<%#Eval("imageID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-Width="50px">
                                <ItemTemplate>
                                    <asp:Image ID="imgImage" runat="server" ImageUrl='<%#Eval("imageUrl") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Naziv" ItemStyle-Width="100%">
                                <ItemTemplate>
                                    <asp:Label ID="lblName" runat="server" Text='<%#Eval("imageUrl") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ShowDeleteButton="true" DeleteText="" DeleteImageUrl="images/delete_icon.png" ButtonType="Image" ItemStyle-Width="20px" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
        <div class="row margin-top-2">
            <div class="col-md-2 b-1">
                <div class="form-group">
                    <label>Width:</label>
                    <asp:TextBox ID="txtImageWidth" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Height:</label>
                    <asp:TextBox ID="txtImageHeight" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Tip:</label>
                    <asp:DropDownList ID="cmbImageType" runat="server" CssClass="form-control" OnSelectedIndexChanged="cmbImageType_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                </div>
                <asp:Button ID="btnResizeImages" runat="server" CssClass="btn btn-primary mb-1" OnClick="btnResizeImages_Click" Text="Podesi dimenzije" Enabled="false" />
            </div>
        </div>
        <div class="row margin-top-2">
            <div class="col-md-6 b-1">
                <div class="row">
                    <div class="col-md-12">
                        <asp:CheckBox ID="chkExcludeNotApproved" runat="server" Text="Isključi neodobrene" Checked="true" CssClass="checkbox" />
                        <asp:CheckBox ID="chkExcludeNotActive" runat="server" Text="Isključi neaktivne" Checked="false" CssClass="checkbox" />
                        <asp:CheckBox ID="chkDeleteOldImageFiles" runat="server" Text="Obriši stare slike" Checked="false" CssClass="checkbox" />
                    </div>
                </div>
                <div class="row mb-1">
                    <div class="col-md-6">
                        <asp:Button ID="btnConvertImagesToWebP" runat="server" OnClick="btnConvertImagesToWebP_Click" Text="Konvertuj slike u WebP format" CssClass="btn btn-primary" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderFooter" runat="server">
</asp:Content>
