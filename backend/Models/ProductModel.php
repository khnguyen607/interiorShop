<?php

class ProductModel extends BaseModel
{
    const TABLE = 'products';

    public function mAlls($select = ['*'])
    {
        return $this->bmAlls(self::TABLE, $select);
    }

    public function mFind($id)
    {
        return $this->bmFind(self::TABLE, $id);
    }

    public function mInsert($data)
    {
        return $this->bmInsert(self::TABLE, $data);
    }

    public function mUpdate($id, $data)
    {
        return $this->bmUpdate(self::TABLE, $id, $data);
    }

    public function mDelete($id)
    {
        $this->_dependency($id);
        return $this->bmDelete(self::TABLE, $id);
    }

    public function mGetCategory($id)
    {
        $id = $_GET['id'];
        $sql = "SELECT syn_products_categories.*, categories.Name
                FROM `syn_products_categories`
                INNER JOIN categories ON syn_products_categories.categoryID = categories.ID
                WHERE syn_products_categories.productID=$id";
        $query = $this->_query($sql);
        $data = [];

        while ($row = mysqli_fetch_assoc($query)) {
            array_push($data, $row);
        }

        return $data;
    }

    public function insertCategory($productID, $categoryID)
    {
        $sql = "INSERT INTO `syn_products_categories`(`productID`, `categoryID`) VALUES ('$productID','$categoryID')";
        $this->_query($sql);
    }

    private function _dependency($productID)
    {
        $this->_query("DELETE FROM `syn_products_categories` WHERE productID=$productID");
        $this->_query("DELETE FROM `orderdetail` WHERE productID=$productID");
    }
}
