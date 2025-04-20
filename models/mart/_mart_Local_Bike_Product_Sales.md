{% docs _mart_Local_Bike_Product_Sales %}

### `docs _mart_Local_Bike_Product_Sales`

#### Description

Le modèle `docs _mart_Local_Bike_Product_Sales` représente la **vue métier finale des ventes** de l’entreprise. Il s’agit d’une table enrichie à partir de différentes sources `staging` et `intermediate`, fournissant une vision consolidée de toutes les commandes passées, incluant les produits, les clients, le personnel et les magasins associés.

#### Grain

Une ligne = une combinaison unique de **commande(order item), produit et client**.

#### Sources

Ce modèle s’appuie sur les données préparées par le modèle intermédiaire `int_Local_Bike__product_sales_enrichie`.

#### Colonnes principales

| Colonne             | Description                                 |
| ------------------- | ------------------------------------------- |
| `customer_id`       | Identifiant unique du client.               |
| `client_first_name` | Prénom du client.                           |
| `client_last_name`  | Nom de famille du client.                   |
| `order_id`          | Identifiant unique de la commande.          |
| `order_date`        | Date à laquelle la commande a été passée.   |
| `shipped_date`      | Date d’expédition de la commande.           |
| `discounted_amount` | Montant payé après application des remises. |
| `product_id`        | Identifiant unique du produit vendu         |

{% enddocs %}
