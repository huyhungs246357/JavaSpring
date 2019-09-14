package com.mycompany.jv30_project_final.entities;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.NamedAttributeNode;
import javax.persistence.NamedEntityGraph;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "product")
@NamedEntityGraph(name = "product.images", attributeNodes = @NamedAttributeNode("images"))
public class ProductEntity implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "product_id")
    private int id;

    @Column(name = "product_name")
    private String proName;
    private double unitPrice;
    private String description;
    @Column(name = "publish_date")
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "yyyy-mm-dd")
    private Date publishDate;
    private String code;
    private int quantityInStore;
    private Boolean available;
    private double discount;

    @Temporal(TemporalType.TIMESTAMP)
    private Date cretedAt = new Date();

    //n-1
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "category_id")
    private CategoryEntity category;

    @OneToMany(mappedBy = "product", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<ImageEntity> images;

    @ManyToMany(cascade = {CascadeType.PERSIST, CascadeType.MERGE},
            fetch = FetchType.EAGER)
    @JoinTable(name = "color_relation",
            joinColumns = @JoinColumn(name = "product_id",
                    referencedColumnName = "product_id"),
            inverseJoinColumns = @JoinColumn(name = "color_id",
                    referencedColumnName = "id"))
    private List<ColorEntity> colors;

//     @ManyToMany(cascade = {CascadeType.PERSIST, CascadeType.MERGE},
//            fetch = FetchType.EAGER)
//    @JoinTable(name = "promotion_relation",
//            joinColumns = @JoinColumn(name = "product_id",
//                    referencedColumnName = "product_id"),
//            inverseJoinColumns = @JoinColumn(name = "promotion_id",
//                    referencedColumnName = "id"))
//    private List<PromotionEntity> promotions;
    public ProductEntity() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public CategoryEntity getCategory() {
        return category;
    }

    public void setCategory(CategoryEntity category) {
        this.category = category;
    }

    public String getProName() {
        return proName;
    }

    public void setProName(String proName) {
        this.proName = proName;
    }

    public double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(double unitPrice) {
        this.unitPrice = unitPrice;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getPublishDate() {
        return publishDate;
    }

    public void setPublishDate(Date publishDate) {
        this.publishDate = publishDate;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public int getQuantityInStore() {
        return quantityInStore;
    }

    public void setQuantityInStore(int quantityInStore) {
        this.quantityInStore = quantityInStore;
    }

    public Boolean getAvailable() {
        return available;
    }

    public void setAvailable(Boolean available) {
        this.available = available;
    }

    public List<ImageEntity> getImages() {
        return images;
    }

    public void setImages(List<ImageEntity> images) {
        this.images = images;
    }

    public List<ColorEntity> getColors() {
        return colors;
    }

    public void setColors(List<ColorEntity> colors) {
        this.colors = colors;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public Date getCretedAt() {
        return cretedAt;
    }

    public void setCretedAt(Date cretedAt) {
        this.cretedAt = cretedAt;
    }

}
