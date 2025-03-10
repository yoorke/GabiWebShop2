﻿using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
using eshopBE;
using eshopBL;
using System.Collections.Generic;
using System.Text;
using System.Text.RegularExpressions;
using eshopBLInterfaces;
using eshopUtilities;
using System.IO;

namespace webshopAdmin
{
    public partial class product : System.Web.UI.Page
    {
        protected void Page_PreInit(object sender, EventArgs e)
        {






            

            /*if (Page.IsPostBack)
            {
                if (Session["dropDownCount"] != null)
                {
                    
                }
            }*/
        }

        protected void Page_Init(object sender, EventArgs e)
        {








            /*if (Page.IsPostBack)
            {
                if (Session["dropDownCollection"] != null)
                {
                    List<string> dropDownCollection = (List<string>)Session["dropDownCollection"];
                    int dropDownCount = 1;
                    foreach (string name in dropDownCollection)
                    {
                        DropDownList dropDownAttribute = new DropDownList();
                        dropDownAttribute.ID = "cmbAttribute" + (dropDownCount++).ToString();
                        tbpCategories.Controls.Add(dropDownAttribute);
                    }
                }
            }*/
        }

        protected override void OnInit(EventArgs e)
        {








            base.OnInit(e);
            
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (User.Identity.IsAuthenticated && (User.IsInRole("administrator") || User.IsInRole("korisnik") || User.IsInRole("prodavac")))
            {
                if (!Page.IsPostBack)
                {
                    loadIntoForm();
                    Session["dropDownCount"] = null;
                    int productID = (Page.Request.QueryString.ToString().Contains("id")) ? int.Parse(Page.Request.QueryString["id"]) : 0;
                    if (productID > 0)
                    {
                        loadProduct(productID);
                    }
                    else
                    { 
                        ViewState.Add("pageTitle", "Novi proizvod");
                        txtDescription.Text = @"<p><span style='font-size:10px;color:#696969'>" + ConfigurationManager.AppSettings["productDescription"] + "</span></p>";
                        imgProduct.Visible = false;
                        imgLarge.Visible = false;
                        imgHome.Visible = false;
                        imgThumb.Visible = false;
                        cmbBrand.SelectedValue = "0";
                    }

                    //ViewState["dropDownCollection"] = null;

                    //TabContainer1.EnableViewState = true;
                    //tbpCategories.EnableViewState = true;
                    Page.EnableViewState = true;

                    Session["dropDownCollection"] = null;

                }
                else
                {
                    if (Session["dropDownCount"] != null)
                    {
                        createControls();
                    }

                    Page.Title = ViewState["pageTitle"].ToString();
                    lblPageHeader.Text = ViewState["productName"] != null ? ViewState["productName"].ToString() : "Proizvod";
                    TabName.Value = Request.Form[TabName.UniqueID];
                    if(ViewState["productVariantControlsCreated"] != null && bool.Parse(ViewState["productVariantControlsCreated"].ToString()))
                        createVariantAttributeControls();
                }
                txtPrice.Enabled = bool.Parse(ConfigurationManager.AppSettings["allowProductPriceChange"]) || Page.Request.QueryString["id"] == null;
                txtWebPrice.Enabled = bool.Parse(ConfigurationManager.AppSettings["allowProductPriceChange"]) || Page.Request.QueryString["id"] == null;
                txtCode.ReadOnly = bool.Parse(ConfigurationManager.AppSettings["autoGenerateProductCode"]);

                Page.MaintainScrollPositionOnPostBack = true;
            }
            else
                Page.Response.Redirect("/" + ConfigurationManager.AppSettings["webshopAdminUrl"] + "/login.aspx?returnUrl=" + Page.Request.RawUrl);

            disableCache();
        }

        private void loadIntoForm()
        {
            loadBrands();

            CategoryBL categoryBL = new CategoryBL();
            //cmbCategory.DataSource = categoryBL.GetCategories();
            cmbCategory.DataSource = categoryBL.GetNestedCategoriesDataTable(true, true);
            cmbCategory.DataTextField = "name";
            cmbCategory.DataValueField = "categoryID";
            cmbCategory.DataBind();

            VatBL vatBL = new VatBL();
            cmbVat.DataSource = vatBL.GetVats();
            cmbVat.DataValueField = "vatID";
            cmbVat.DataTextField = "vatValue";
            cmbVat.DataBind();
            cmbVat.SelectedIndex = 3;

            loadSupplier();

            PromotionBL promotionBL = new PromotionBL();
            cmbPromotions.DataSource = promotionBL.GetPromotions(true, null, null);
            cmbPromotions.DataTextField = "name";
            cmbPromotions.DataValueField = "promotionID";
            cmbPromotions.DataBind();

            cmbUnitOfMeasure.DataSource = new UnitOfMeasureBL().GetUnitsOfMeasure(true);
            cmbUnitOfMeasure.DataTextField = "FullName";
            cmbUnitOfMeasure.DataValueField = "unitOfMeasureID";
            cmbUnitOfMeasure.SelectedValue = "2";
            cmbUnitOfMeasure.DataBind();

            cmbCategories.DataSource = categoryBL.GetNestedCategoriesDataTable(true, false);
            cmbCategories.DataTextField = "name";
            cmbCategories.DataValueField = "categoryID";
            cmbCategories.DataBind();

            if (!bool.Parse(ConfigurationManager.AppSettings["productInMultipleCategories"]))
                divProductInMultipleCategories.Visible = false;
            else
                btnAddProductToCategory.Enabled = cmbCategory.SelectedIndex > 0 ? true : false;
        }

        private void loadSupplier()
        {
            SupplierBL supplierBL = new SupplierBL();
            cmbSupplier.DataSource = supplierBL.GetSuppliers(false);
            cmbSupplier.DataTextField = "name";
            cmbSupplier.DataValueField = "supplierID";
            cmbSupplier.DataBind();
            cmbSupplier.SelectedValue = "0";
        }

        private void loadManufacturers()
        {
            
        }

        private void loadBrands()
        {
            BrandBL brandBL = new BrandBL();
            cmbBrand.DataSource = brandBL.GetBrands(false);
            cmbBrand.DataTextField = "name";
            cmbBrand.DataValueField = "brandID";
            cmbBrand.DataBind();
        }

        private void loadProduct(int productID)
        {
            ProductBL productBL = new ProductBL();
            Product product = productBL.GetProduct(productID, string.Empty, false, string.Empty);

            if(product != null)
            { 
                lblProductID.Value = product.ProductID.ToString();
                txtCode.Text = product.Code;
                txtSupplierCode.Text = product.SupplierCode;
                txtName.Text = product.Name;
                cmbBrand.SelectedValue = cmbBrand.Items.FindByValue(product.Brand.BrandID.ToString()).Value;
                txtDescription.Text = product.Description;
                txtPrice.Text = string.Format("{0:N2}", product.Price);
                txtWebPrice.Text = string.Format("{0:N2}", product.WebPrice);
                txtInsertDate.Text = product.InsertDate.ToString();
                txtUpdateDate.Text = product.UpdateDate.ToString();
                cmbVat.SelectedValue = cmbVat.Items.FindByValue(product.VatID.ToString()).Value;
                cmbSupplier.SelectedValue = cmbSupplier.Items.FindByValue(product.SupplierID.ToString()).Value;
                chkApproved.Checked = product.IsApproved;
                chkActive.Checked = product.IsActive;
                chkLocked.Checked = product.IsLocked;
                chkInStock.Checked = product.IsInStock;
                txtEan.Text = product.Ean;
                txtSpecification.Text = product.Specification;
                Page.Title = product.Name + " | Admin panel";
                ViewState.Add("pageTitle", Page.Title);
                txtSupplierPrice.Text = string.Format("{0:N2}", product.SupplierPrice);
                cmbUnitOfMeasure.SelectedValue = product.UnitOfMeasure.UnitOfMeasureID.ToString();
                lblPageHeader.Text = product.Name;
                ViewState.Add("productName", product != null ? product.Name : string.Empty);
                chkPriceLocked.Checked = product.IsPriceLocked;
                txtDeclaration.Text = product.Declaration;
                txtWeight.Text = string.Format("{0:N2}", product.Weight);
                chkCanBeDelivered.Checked = product.CanBeDelivered;
                txtComment.Text = product.Comment;
                txtShortDescription.Text = product.ShortDescription;
                chkIsFreeDelivery.Checked = product.IsFreeDelivery;

                if (product.Promotion != null)
                {
                    cmbPromotions.SelectedValue = cmbPromotions.Items.FindByValue(product.Promotion.PromotionID.ToString()).Value;
                    txtPromotionPrice.Text = product.Promotion.Price.ToString();
                }

                if (product.Categories != null)
                {
                    cmbCategory.SelectedValue = cmbCategory.Items.FindByValue(product.Categories[0].CategoryID.ToString()).Value;
                    createControls();
                    createVariantAttributeControls();
                    ViewState.Add("productVariantControlsCreated", true);
                    int i = 0;
                    if (product.Attributes != null)
                    {
                        int attributeID = -1;
                        foreach (object control in pnlAttributes.Controls)
                        {
                            if (control is Literal)
                            {
                                int.TryParse(((Literal)control).Text, out attributeID);
                            }
                            if (control is customControls.AttributeControl)
                            {
                                int index;
                                if ((index = hasAttribute(product.Attributes, attributeID)) > -1)
                                    ((customControls.AttributeControl)control).AttributeValueID = product.Attributes[index].AttributeValueID;
                                else
                                    ((customControls.AttributeControl)control).AttributeValue = "NP";
                            }
                        }
                    }
                    btnAddProductToCategory.Enabled = true;

                    if(product.Categories.Count > 1)
                    {
                        for(int j = 1; j < product.Categories.Count; j++)
                        {
                            lstCategories.Items.Add(new ListItem(product.Categories[j].Name, product.Categories[j].CategoryID.ToString()));
                        }
                    }

                    btnAddProductVariant.Enabled = true;
                }

                if (product.Images != null)
                {
                    ViewState.Add("images", product.Images);
                    loadImages();

                    string imageUrl = product.Images[0].ImageUrl.Substring(0, product.Images[0].ImageUrl.LastIndexOf("."));
                    string extension = product.Images[0].ImageUrl.Substring(product.Images[0].ImageUrl.LastIndexOf('.'));
                    string directory = new ProductBL().CreateImageDirectory(int.Parse(imageUrl));
                    imgProduct.ImageUrl = directory + imageUrl + "-" + ConfigurationManager.AppSettings["mainName"] + extension;
                    imgHome.ImageUrl = directory + imageUrl + "-" + ConfigurationManager.AppSettings["listName"] + extension;
                    imgLarge.ImageUrl = directory + imageUrl + "-" + ConfigurationManager.AppSettings["thumbName"] + extension;
                    imgThumb.ImageUrl = directory + imageUrl + "-" + ConfigurationManager.AppSettings["thumbName"] + extension;
                
                }

                loadProductVariants();
            }
            /*rptImages.DataSource = product.Images;
            rptImages.DataBind();*/
        }

        protected void btnImageUpload_Click(object sender, EventArgs e)
        {
            if (fluImage.HasFile)
            {
                
                string extension = fluImage.FileName.Substring(fluImage.FileName.LastIndexOf('.'));
                string fullpath = Server.MapPath("~") + new ProductBL().CreateNewImageName(ViewState["images"] != null ? ((List<ProductImage>)ViewState["images"]).Count : 0) + extension;


                //fluImage.SaveAs(Server.MapPath("~") + "/images/" + fluImage.FileName);
                fluImage.SaveAs(fullpath);

                if(!(new ImagesBL().IsImageRezolutionSifficient(fullpath)))
                {
                    setStatus($"Veličina slike i rezolucija nisu dovoljni da bi prikaz slike proizvoda bio zadovoljavajući. Izaberite sliku koja ima rezoluciju od bar: " +
                        $"{ConfigurationManager.AppSettings["preferredImageWidth"]}px x {ConfigurationManager.AppSettings["preferredImageHeight"]}px.", "warning");

                    fluImage.Dispose();
                    File.Delete(fullpath);

                    return;
                }

                //System.Drawing.Image original = System.Drawing.Image.FromFile(Server.MapPath("~") + "/images/" + fluImage.FileName);

                //string path=Server.MapPath("~")+"/images/";
                //System.Drawing.Image thumb = original.GetThumbnailImage(290, 232, null, IntPtr.Zero);
                //System.Drawing.Image thumb = eshopUtilities.Common.CreateThumb(original, 290, 232);
                //thumb.Save(path + fluImage.FileName.Substring(0, fluImage.FileName.IndexOf(".jpg")) + "-main.jpg");

                //thumb = original.GetThumbnailImage(110, 75, null, IntPtr.Zero);
                //thumb = eshopUtilities.Common.CreateThumb(original, 160, 110);
                //thumb.Save(path + fluImage.FileName.Substring(0, fluImage.FileName.IndexOf(".jpg")) + "-list.jpg");


                //thumb = original.GetThumbnailImage(30, 24, null, IntPtr.Zero);
                //thumb = eshopUtilities.Common.CreateThumb(original, 50, 40);
                //thumb.Save(path + fluImage.FileName.Substring(0, fluImage.FileName.IndexOf(".jpg")) + "-thumb.jpg");

                List<ProductImage> images;
                if (ViewState["images"] != null)
                    images = (List<ProductImage>)ViewState["images"];
                else
                    images = new List<ProductImage>();

                bool exists = new ProductBL().CreateProductImages(fullpath);
                if(exists)
                {
                    string filename = fullpath.Substring(fullpath.LastIndexOf('/') + 1);
                    if(bool.Parse(ConfigurationManager.AppSettings["useWebPImages"]))
                    {
                        filename = filename.Substring(0, filename.LastIndexOf('.')) + ".webp";
                    }

                    //images.Add(new ProductImage(fullpath.Substring(fullpath.LastIndexOf('/') + 1), images.Count + 1));
                    images.Add(new ProductImage(filename, images.Count + 1));
                }

                ViewState.Add("images",images);

                loadImages();
            }
        }

        private void loadImages()
        {
            List<ProductImage> images = null;
            if (ViewState["images"] != null)
                images = (List<ProductImage>)ViewState["images"];

            rptImages.DataSource = images;
            rptImages.DataBind();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            saveProduct();
        }

        protected void btnSaveClose_Click(object sender, EventArgs e)
        {
            saveProduct();
            Response.Redirect("~/" + ConfigurationManager.AppSettings["webshopAdminUrl"] + "/products.aspx");
        }

        protected void btnClose_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/" + ConfigurationManager.AppSettings["webshopAdminUrl"] + "/products.aspx");
        }

        private void saveProduct()
        {
            try
            {
                //main data
                Product product = new Product();
                product.Name = txtName.Text;
                //product.Code = bool.Parse(ConfigurationManager.AppSettings["fillZeroCode"]) ? txtCode.Text.PadLeft(13, '0') : txtCode.Text;
                product.Code = fillZeros(bool.Parse(ConfigurationManager.AppSettings["fillZeroCode"]), txtCode.Text);
                product.SupplierCode = txtSupplierCode.Text;
                product.Brand = new Brand();
                product.Brand.BrandID = int.Parse(cmbBrand.SelectedValue);
                product.Description = txtDescription.Text;

                double price = 0;
                double.TryParse(txtPrice.Text, out price);
                //product.Price = double.Parse(txtPrice.Text);
                product.Price = price;

                double webPrice = 0;
                double.TryParse(txtWebPrice.Text, out webPrice);
                //product.WebPrice = double.Parse(txtWebPrice.Text);
                product.WebPrice = webPrice;

                product.VatID = int.Parse(cmbVat.SelectedValue);
                //product.InsertDate = product.UpdateDate = DateTime.Now;
                product.SupplierID = int.Parse(cmbSupplier.SelectedValue);
                product.IsApproved = chkApproved.Checked;
                product.IsActive = chkActive.Checked;
                product.IsLocked = chkLocked.Checked;
                product.IsInStock = chkInStock.Checked;
                //product.Ean = bool.Parse(ConfigurationManager.AppSettings["fillZeroBarcode"]) ? txtEan.Text.PadLeft(13, '0') : txtEan.Text;
                product.Ean = fillZeros(bool.Parse(ConfigurationManager.AppSettings["fillZeroBarcode"]), txtEan.Text);
                product.Specification = txtSpecification.Text;
                product.ProductID = (lblProductID.Value != string.Empty) ? int.Parse(lblProductID.Value) : 0;
                product.UnitOfMeasure = new UnitOfMeasure(int.Parse(cmbUnitOfMeasure.SelectedValue), cmbUnitOfMeasure.SelectedItem.Text, string.Empty);
                product.IsPriceLocked = chkPriceLocked.Checked;
                product.Declaration = txtDeclaration.Text;

                double weight = 0;
                double.TryParse(txtWeight.Text, out weight);

            //product.Weight = double.Parse(txtWeight.Text);
                product.Weight = weight;
                product.WeightRangeID = null;
                product.CanBeDelivered = chkCanBeDelivered.Checked;
                product.Comment = txtComment.Text;
                product.ShortDescription = txtShortDescription.Text;
                product.IsFreeDelivery = chkIsFreeDelivery.Checked;

                if (cmbPromotions.SelectedIndex > 0)
                {
                    product.Promotion = new Promotion();
                    product.Promotion.PromotionID = int.Parse(cmbPromotions.SelectedValue);
                    product.Promotion.Price = double.Parse(txtPromotionPrice.Text);
                }

                //category and attributes
                if (cmbCategory.SelectedIndex > -1)
                {
                    product.Categories = new List<Category>();
                    product.Categories.Add(new Category(int.Parse(cmbCategory.SelectedValue), cmbCategory.SelectedItem.Text, 0, string.Empty, string.Empty, 0, 0, 0, string.Empty, true, 0, false, false, 0, 0, 0));
                    product.Attributes = new List<AttributeValue>();

                    if(bool.Parse(ConfigurationManager.AppSettings["productInMultipleCategories"]))
                        foreach (ListItem item in lstCategories.Items)
                        {
                            product.Categories.Add(new Category(int.Parse(item.Value), item.Text, 0, string.Empty, string.Empty, 0, 0, 0, string.Empty, true, -1, false, false, 0, 0, 0));
                        }

                    //foreach (object obj in TabContainer1.Controls)
                    //{
                    //if (obj is AjaxControlToolkit.TabPanel)
                    //{
                    //AjaxControlToolkit.TabPanel tabPanel = obj as AjaxControlToolkit.TabPanel;

                    //if (tabPanel.ID == "tbpCategories")
                    //{

                    foreach (object control in pnlAttributes.Controls)
                        if (control is customControls.AttributeControl)
                        {
                            //Control c = tpControl as Control;
                            //foreach (object innerCtrl in c.Controls)
                            //{
                            //if (innerCtrl is DropDownList)
                            //if (((DropDownList)tpControl).ID != "cmbCategory")
                            product.Attributes.Add(new AttributeValue(((customControls.AttributeControl)control).AttributeValueID, ((customControls.AttributeControl)control).AttributeValue, -1, 0, string.Empty, 0));
                            //}

                        }
                    //}
                    //}
                    //}
                }

                //images
                if (rptImages.Items.Count > 0)
                {
                    product.Images = new List<ProductImage>();
                    //List<ProductImage> images = (List<ProductImage>)ViewState["images"];
                    foreach (RepeaterItem productImage in rptImages.Items)
                    {
                        product.Images.Add(new ProductImage(((Label)productImage.FindControl("lblImageUrl")).Text, int.Parse(((TextBox)productImage.FindControl("txtSortOrder")).Text)));
                    }
                }



                ProductBL productBL = new ProductBL();
                string productID = productBL.SaveProduct(product).ToString();
                //if (lblProductID.Value == "0")
                    lblProductID.Value = productID;

                createVariantAttributeControls();
                ViewState.Add("productVariantControlsCreated", true);
                btnAddProductVariant.Enabled = true;

                setStatus("Artikal uspešno sačuvan.", "success");
            }
            catch(Exception ex)
            {
                string message = ex.Message + (ex.InnerException != null ? " - " + ex.InnerException.Message : string.Empty);
                setStatus($"Greška prilikom čuvanja artikla. {message}", "danger");
                ErrorLog.LogError(ex);
            }
        }

        protected void cmbCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            createControls();
            //createVariantAttributeControls();
            if (cmbCategory.SelectedIndex > 0)
                btnAddProductToCategory.Enabled = true;

            if(bool.Parse(ConfigurationManager.AppSettings["autoGenerateProductCode"]))
            {
                createProductCode(int.Parse(cmbCategory.SelectedValue));
            }



            /*AttributeBL attributeBL = new AttributeBL();
            List<eshopBE.Attribute> attributes = attributeBL.GetAttributesForCategory(int.Parse(cmbCategory.SelectedValue));

            pnlAttributes.Controls.Add(new LiteralControl("<br />"));

            List<string> dropDownCollection = new List<string>();
            Session["dropDownCollection"] = null;
            int dropDownCount = Session["dropDownCount"] == null ? 1 : int.Parse(Session["dropDownCount"].ToString());
            dropDownCount = 1;
            foreach(eshopBE.Attribute attribute in attributes)
            {
                pnlAttributes.Controls.Add(new LiteralControl("<p class='row'>"));
                pnlAttributes.Controls.Add(new LiteralControl("<label class='label'>"));
                Literal name = new Literal();
                name.Text = attribute.Name + ": ";
                pnlAttributes.Controls.Add(name);
                pnlAttributes.Controls.Add(new LiteralControl("</label>"));

                DropDownList dropDownAttribute = new DropDownList();
                dropDownAttribute.ID = "cmbAttribute" + (dropDownCount++).ToString();
                dropDownAttribute.DataSource = attributeBL.GetAttributeValues(attribute.AttributeID);
                dropDownAttribute.DataTextField = "value";
                dropDownAttribute.DataValueField = "attributeValueID";
                dropDownAttribute.DataBind();
                dropDownAttribute.EnableViewState = true;

                pnlAttributes.Controls.Add(dropDownAttribute);

                pnlAttributes.Controls.Add(new LiteralControl("</p>"));

                dropDownCollection.Add(attribute.Name);
            }

            Session.Add("dropDownCollection", dropDownCollection);
            Session.Add("dropDownCount", dropDownCount);*/
        }

        protected override object SaveViewState()
        {
            /*object[] newViewState = new object[2];

            List<int> attributeIDs = new List<int>();

            foreach(object obj in pnlAttributes.Controls)
            {
                if (obj is DropDownList)
                {
                    if (((DropDownList)obj).ID.Contains("cmbAttribute"))
                    {
                        attributeIDs.Add((int.Parse(((DropDownList)obj).SelectedValue)));
                    }
                }
            }

            newViewState[0] = attributeIDs;
            newViewState[1] = base.SaveViewState();
            return newViewState;*/
            return base.SaveViewState();
        }

        protected override void LoadViewState(object savedState)
        {
            /*if (savedState is object[] && ((object[])savedState).Length == 2 && ((object[])savedState)[0] is List<int>)
            {
                object[] newViewState = (object[])savedState;
                List<int> attributesIDs = (List<int>)(newViewState[0]);
                if (attributesIDs.Count > 0)
                {
                    int count = 1;
                    foreach (int i in attributesIDs)
                    {
                        DropDownList dropDownList = new DropDownList();
                        dropDownList.ID = "cmbAttribute" + (count++).ToString();
                        //dropDownList.SelectedValue = dropDownList.Items.FindByValue(attributesIDs[i].ToString()).Value;
                        pnlAttributes.Controls.Add(dropDownList);
                    }
                }
                base.LoadViewState(newViewState[1]);
            }
            else
            {
                base.LoadViewState(savedState);
            }*/
            base.LoadViewState(savedState);
        }

        private void createControls()
        {
            AttributeBL attributeBL = new AttributeBL();
            List<eshopBE.Attribute> attributes = attributeBL.GetAttributesForCategory(int.Parse(cmbCategory.SelectedValue));

            pnlAttributes.Controls.Add(new LiteralControl("<br />"));
            pnlAttributes.Controls.Clear();
            int count = 1;
            if (attributes != null)
            {
                foreach (eshopBE.Attribute attribute in attributes)
                {
                    pnlAttributes.Controls.Add(new LiteralControl("<div class='form-group'>"));
                    pnlAttributes.Controls.Add(new LiteralControl("<label for='ctl00_ContentPlaceHolder1_cmbAttribute" + (count).ToString() + "_cmbAttribute'>"));
                    Literal name = new Literal();
                    name.Text = attribute.Name + ": ";
                    pnlAttributes.Controls.Add(name);
                    name = new Literal();
                    name.Text = attribute.AttributeID.ToString();
                    name.Visible = false;
                    pnlAttributes.Controls.Add(name);
                    pnlAttributes.Controls.Add(new LiteralControl("</label>"));

                    /*DropDownList dropDownAttribute = new DropDownList();
                    dropDownAttribute.ID = "cmbAttribute" + (count++).ToString();
                    dropDownAttribute.DataSource = attributeBL.GetAttributeValues(attribute.AttributeID);
                    dropDownAttribute.DataTextField = "value";
                    dropDownAttribute.DataValueField = "attributeValueID";
                    dropDownAttribute.DataBind();
                    dropDownAttribute.EnableViewState = true;

                    pnlAttributes.Controls.Add(dropDownAttribute);*/

                    //attribute user control
                    //UserControl attributeControl = (UserControl)Page.LoadControl("customControls/AttributeControl.ascx");
                    Control ac = new Control();
                    ac = LoadControl("customControls/AttributeControl.ascx");
                    ac.ID = "cmbAttribute" + (count++).ToString();
                    ((customControls.AttributeControl)ac).AttributeID = attribute.AttributeID;
                    
                    pnlAttributes.Controls.Add(ac);

                    pnlAttributes.Controls.Add(new LiteralControl("</div><!--form-group-->"));


                }
            }
            Session.Add("dropDownCount", count - 1);
        }

        /*protected void btnImageUpload_Click(object sender, EventArgs e)
        {
        }*/

        protected void rptImages_ItemCommand(object sender, RepeaterCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "delete": 
                    {
                        string imageUrl = ((Label)e.Item.FindControl("lblImageUrl")).Text;

                        List<ProductImage> images=(List<ProductImage>)ViewState["images"];
                        foreach (ProductImage productImage in images)
                        {
                            if (productImage.ImageUrl == imageUrl)
                            {
                                images.Remove(productImage);
                                break;
                            }
                        }
                        ViewState.Add("images", images);
                        loadImages();
                        break; 
                    }
            }
        }

        private int hasAttribute(List<AttributeValue> attributes, int attributeID)
        {
            int attributeIndex = -1;
            int i = 0;
            foreach (AttributeValue attributeValue in attributes)
            {
                if (attributeValue.AttributeID == attributeID)
                {
                    attributeIndex = i;
                    break;
                }
                i++;
            }
            return attributeIndex;
        }

        protected void cmbPromotions_SelectedIndexChanged(object sender, EventArgs e)
        {
            //double value = cmbPromotions.SelectedItem;
            //txtPromotionPrice.Text = ((Promotion)cmbPromotions.SelectedItem).Value.ToString();
            if (cmbPromotions.SelectedIndex > 0)
            {
                double value = new PromotionBL().GetPromotion(int.Parse(cmbPromotions.SelectedValue)).Value;
                txtPromotionPrice.Text = ((int)(double.Parse(txtWebPrice.Text) / ((value / 100) + 1)) / 100 * 100 - 10).ToString();
            }
        }

        protected void btnAddAttributeValue_Click(object sender, EventArgs e)
        {
            switch(lblType.Value)
            {
                case "attribute":
                    {
                        AttributeBL attributeBL = new AttributeBL();
                        attributeBL.SaveAttributeValue(new AttributeValue(-1, txtAttributeValue.Text, int.Parse(lblAttributeID.Value), 0, string.Empty, 0), false);

                        foreach (object control in pnlAttributes.Controls)
                            if (control is customControls.AttributeControl)
                                if (((customControls.AttributeControl)control).ID == lblAttributeName.Value)
                                    ((customControls.AttributeControl)control).setValues(txtAttributeValue.Text);
                        break;
                    }
                case "supplier":
                    {
                        SupplierBL supplierBL = new SupplierBL();
                        supplierBL.SaveSupplier(new Supplier(-1, txtAttributeValue.Text));
                        loadSupplier();
                        break;
                    }

                case "brand":
                    {
                        BrandBL brandBL = new BrandBL();
                        brandBL.SaveBrand(new Brand(-1, txtAttributeValue.Text, string.Empty));
                        loadBrands();
                        break;
                    }
            }
            txtAttributeValue.Text = string.Empty;
        }

        protected void rptImages_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Image image = ((Image)e.Item.FindControl("imgProduct"));
                image.ImageUrl = new ProductBL().CreateImageDirectory(int.Parse(image.ImageUrl.Substring(0, image.ImageUrl.LastIndexOf('.')))) + image.ImageUrl;
                //if (!image.ImageUrl.Contains("images/"))
                //{
                    //image.ImageUrl = "/images/" + image.ImageUrl;
                //}
            }
        }

        protected void btnAddProductToCategory_Click(object sender, EventArgs e)
        {
            ListItem listItem = new ListItem(cmbCategories.SelectedItem.Text, cmbCategories.SelectedValue);
            if(!lstCategories.Items.Contains(listItem))
                lstCategories.Items.Add(listItem);
        }

        protected void btnRemoveProductFromCategory_Click(object sender, EventArgs e)
        {
            ListItem[] listItems = new ListItem[lstCategories.Items.Count];
            lstCategories.Items.CopyTo(listItems, 0);

            foreach (ListItem item in listItems)
                if (item.Selected)
                    lstCategories.Items.Remove(item);
        }

        private string fillZeros(bool fillZeros, string code)
        {
            if(fillZeros)
            {
                Regex regex = new Regex("[a-zA-Z]");
                if (!regex.IsMatch(code))
                    return code.PadLeft(13, '0');
                else
                    return code;
            }
            return code;
        }

        protected void btnSaveAs_Click(object sender, EventArgs e)
        {
            int productID = -1;
            if(int.TryParse(lblProductID.Value, out productID))
            {
                lblProductID.Value = "-1";
                txtCode.Text = string.Empty;
                txtSupplierCode.Text = string.Empty;
                txtEan.Text = string.Empty;
                cmbSupplier.SelectedIndex = -1;

                txtCode.Focus();

                setStatus("Proizvod će biti sačuvan kao novi nakon unosa šifre, barkoda i šifre dobavljača.", "info");
            }
        }

        private void setStatus(string text, string classes)
        {
            customStatus.Text = text;
            customStatus.Class = classes;
            customStatus.Show();
        }

        private void disableCache()
        {
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetExpires(DateTime.Now.AddDays(-1));
            Response.Cache.SetNoStore();
            Response.Cache.SetProxyMaxAge(new TimeSpan(0, 0, 0));
            Response.Cache.SetValidUntilExpires(false);
            Response.Cache.SetRevalidation(HttpCacheRevalidation.AllCaches);
        }

        private void createProductCode(int categoryID)
        {
            txtCode.Text = new ProductBL().GetNewProductCode(categoryID);
        }

        private void createVariantAttributeControls()
        {
            List<eshopBE.Attribute> attributes = new AttributeBL().GetVariantAttributesForCategory(int.Parse(cmbCategory.SelectedValue));

            if(attributes != null)
            {
                int count = 1;
                string controlSize = "2";

                pnlVariantAttributes.Controls.Clear();

                foreach(eshopBE.Attribute attribute in attributes)
                {
                    pnlVariantAttributes.Controls.Add(new LiteralControl("<div class='col-lg-" + controlSize + "'>"));
                    pnlVariantAttributes.Controls.Add(new LiteralControl("<div class='form-group'>"));
                    pnlVariantAttributes.Controls.Add(new LiteralControl("<label for='cmbVariantAttribute" + (count).ToString() + "'>"));
                    Literal lblName = new Literal();
                    lblName.Text = attribute.Name + ":";
                    pnlVariantAttributes.Controls.Add(lblName);
                    Literal lblAttributeID = new Literal();
                    lblAttributeID.Text = attribute.AttributeID.ToString();
                    lblAttributeID.Visible = false;
                    pnlAddAttributeValue.Controls.Add(lblAttributeID);
                    pnlVariantAttributes.Controls.Add(new LiteralControl("</label>"));
                    Control ac = new Control();
                    ac = LoadControl("customControls/AttributeControl.ascx");
                    ac.ID = "cmbVariantAttribute" + (count++).ToString();
                    ((customControls.AttributeControl)ac).ShowNP = false;
                    ((customControls.AttributeControl)ac).AttributeID = attribute.AttributeID;
                    //pnlAddAttributeValue.Controls.Add(ac);
                    pnlVariantAttributes.Controls.Add(ac);
                    pnlVariantAttributes.Controls.Add(new LiteralControl("</div>"));
                    pnlVariantAttributes.Controls.Add(new LiteralControl("</div>"));
                }
            }
        }

        protected void btnAddProductVariant_Click(object sender, EventArgs e)
        {
            //if(txtVariantCode.Text.Trim() != string.Empty &&
                //txtVariantPrice.Text.Trim() != string.Empty)
            //{
                ProductVariant productVariant = new ProductVariant();
                productVariant.Code = txtVariantCode.Text;
                productVariant.Price = txtVariantPrice.Text == string.Empty ? 0 : double.Parse(txtVariantPrice.Text);
                productVariant.IsInStock = chkVariantIsInStock.Checked;
                productVariant.ProductID = int.Parse(lblProductID.Value);
                productVariant.Attributes = new List<AttributeValue>();

                foreach(object control in pnlVariantAttributes.Controls)
                {
                    if(control is customControls.AttributeControl)
                    {
                        productVariant.Attributes.Add(new AttributeValue(((customControls.AttributeControl)control).AttributeValueID, ((customControls.AttributeControl)control).AttributeValue, -1, 0, string.Empty, 0));
                    }
                }

                new ProductVariantBL().Save(productVariant);

            loadProductVariants();
            //}
        }

        private void loadProductVariants()
        {
            int productID = -1;
            if (int.TryParse(lblProductID.Value, out productID)) { 
                DataTable productVariants = new ProductVariantBL().GetProductVariants(productID);
                dgvProductVariants.DataSource = productVariants;
                dgvProductVariants.DataBind();
            }
        }

        protected void dgvProductVariants_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            new ProductVariantBL().DeleteProductVariant(int.Parse(dgvProductVariants.DataKeys[e.RowIndex].Values[0].ToString()));
            loadProductVariants();
        }

        protected void chkIsInStock_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox checkbox = (CheckBox)sender;
            GridViewRow gridViewRow = (GridViewRow)checkbox.NamingContainer;

            new ProductVariantBL().SetIsInStock(int.Parse(((Label)gridViewRow.FindControl("lblProductVariantID")).Text), bool.Parse(((CheckBox)gridViewRow.FindControl("chkIsInStock")).Checked.ToString()));
        }

        private void createProductVariant(string code, double price, bool isInStock, int productID, List<AttributeValue> attributeValues)
        {
            ProductVariant productVariant = new ProductVariant();
            productVariant.Code = code;
            productVariant.Price = price;
            productVariant.IsInStock = isInStock;
            productVariant.ProductID = productID;
            productVariant.Attributes = new List<AttributeValue>();

            foreach(var attributeValue in attributeValues)
            {
                productVariant.Attributes.Add(attributeValue);
            }

            new ProductVariantBL().Save(productVariant);
        }

        private void createAllProductVariantCombinations()
        {
            List<List<int>> values = getAllVariantAttributeValues();
            int counter = 1;

            var allValues = values.Aggregate(
                Enumerable.Empty<int>().AsSingleton(),
                (accumulator, sequence) => accumulator.SelectMany(
                    accseq => sequence,
                    (accseq, item) => accseq.Concat(new[] { item }))
                );

            foreach(var value in allValues)
            {
                List<AttributeValue> attributeValues = new List<AttributeValue>();
                foreach(var attributeID in value)
                {
                    attributeValues.Add(new AttributeValue(attributeID, string.Empty, -1, 0, string.Empty, 0));
                }
                createProductVariant(txtCode.Text + $"-{(counter++).ToString()}", double.Parse(txtWebPrice.Text), true, int.Parse(lblProductID.Value), attributeValues);
            }

            loadProductVariants();
        }

        private List<List<int>> getAllVariantAttributeValues()
        {
            List<List<int>> values = new List<List<int>>();
            foreach(object control in pnlVariantAttributes.Controls)
            {
                if(control is customControls.AttributeControl)
                {
                    List<int> attributeValuesList = new List<int>();
                    foreach(var value in ((customControls.AttributeControl)control).GetValues())
                    {
                        attributeValuesList.Add(value.AttributeValueID);
                    }
                    values.Add(attributeValuesList);
                }
            }

            return values;
        }

        protected void btnCreateAllProductVariants_Click(object sender, EventArgs e)
        {
            createAllProductVariantCombinations();
        }

        protected void btnConvertImage_Click(object sender, EventArgs e)
        {
            IImageConvertor imageConvertor = new ImageConvertor();
            List<ProductImage> images = (List<ProductImage>)ViewState["images"];
            List<ProductImage> convertedImages = new List<ProductImage>();

            foreach(var image in images)
            {
                int imageId = int.Parse(image.ImageUrl.Substring(0, image.ImageUrl.LastIndexOf('.')));
                string imagePath = new ProductBL().CreateImageDirectory(imageId) + image.ImageUrl;
                string newImageUrl = imageConvertor.ConvertImageToWebP(imagePath);

                ProductImage pi = new ProductImage()
                {
                    Filename = image.Filename,
                    ImageUrl = newImageUrl,
                    SortOrder = image.SortOrder
                };
                convertedImages.Add(pi);
            }

            ViewState["images"] = convertedImages;
            loadImages();

            setStatus("Slike uspešno konvertovane u WebP format.", "success");
        }

        protected void btnResizeImage_Click(object sender, EventArgs e)
        {
            new ImagesBL().ResizeProductImages(int.Parse(lblProductID.Value));

            setStatus("Izmena rezolucija slika uspešno izvršena.", "success");
        }
    }

    public static class Extensions
    {
        public static IEnumerable<T> AsSingleton<T>(this T item) => new[] { item };
    }
}
