# 11 · Features & Screens Map (Mobile App — Client)

Built from Figma *Rayyan Water - App | Client* → **Final Designs** page. Every Figma section below maps to
one feature folder in `lib/features/`. Open a screen with:
`https://www.figma.com/design/sxA4J40pyVG9HhkAe7jm6A/Rayyan-Water---App-%7C-Client?node-id=<id with - instead of :>`

> 🚫 Rider App: out of scope. Order-status notifications shown here are **received** by the client app; no
> rider screens, routes or models belong in this codebase.
>
> Only use the **Final Designs** page. Ignore *Under Review*, *Work In Progress*, *Playground* and *Trash*.
> The *Components* page (`740:14875`) is the source for shared widgets.

## 1. Feature → Figma section

| Feature folder | Figma section (node) | What it covers |
|---|---|---|
| `onboarding` | App Icon, Splash, Select language (`3874:71056`) | Splash, first-launch language selection (English / Arabic) |
| `home` | Home (`3874:71491`); latest Home iteration `4647:120444` (outside any section) | Home feed, floating cart state, notification badge, optional sections, mosque banner, upcoming repeat delivery |
| `notifications` | Notification (`3876:75492`) | Notification list grouped by Today / Yesterday / date, empty state |
| `catalog` | Product Listing – End to End Journey (`3876:76846`), Updated Product Detail Page (`4128:105137`) | Product list, category tabs, search + recent searches, filter sheet, product detail |
| `addresses` | Select Location (`3879:85401`); Nearby mosque delivery `4906:80755` (outside any section) | Map picker, current location, saved addresses, suggestions, add/edit/delete address, photo auto-fill — separate flows **for guest** and **for logged-in users** |
| `favourites` | My Favourites (`3880:92060`) | Favourites list with category tabs, remove confirmation, empty state |
| `cart` | Cart Flow (`3884:95782`) | Cart, quantity, add-ons, coupons, order summary, minimum-order nudge, empty cart |
| `auth` | Cart Flow (login part) + Profile (OTP parts) | Mobile login (+974), 4-digit OTP with 00:59 resend timer, "Fill your details", incorrect number/OTP errors |
| `checkout` | Check Out Flow (`3884:97191`) | Delivery address, delivery mode (Deliver / Repeat Order), date & slot, repeat-order setup, special instructions, payment method, bill summary, order placed |
| `orders` | Order Detail (`4589:94388`); Home → Easy Reorder / Upcoming Repeat Delivery | Order history with status tabs, one-time and recurring detail, pause / cancel subscription, refund summary |
| `payments` | Checkout + Profile → Saved Cards | Saved cards (add / edit / delete), QPay debit card, cash to driver |
| `rewards` | Loyalty Points (`4592:110277`); Profile → Rewards & Offers | Points balance & value, expiring points, how to earn & redeem, available coupons |
| `profile` | Profile (`4147:83566`) | My profile, change mobile / email (with OTP), change language, delete account, logout |
| `support` | Profile → Support & More | WhatsApp support, About Us, Terms & Conditions, Privacy Policy, Return & Refund Policy |

App-wide (not a feature): **locale** (`LocaleCubit` in `app/`), **auth session** (`AuthCubit` in `app/`), **cart badge** (app-scoped `CartSummaryCubit`).

## 2. Screens per feature

### onboarding
- Splash (`3874:71061`) — full-bleed splash image + bilingual logo.
- Language selection (`3874:71071`) — "Language Selection" bottom sheet over the splash.

### home (`3874:71509`)
Top → bottom: navy header (location selector "Home ▾" + address, notification bell, search field
"Search 'Sparkling Water'", promo banner carousel) → info strip ("Free delivery on every order • Minimum
Order QAR 150") → "Pure by Nature / Refreshment in Every Drop" category grid (Still Water Glass, Alkaline,
Kids Bottle, Others, Sparkling, Natural) → **Easy Reorder** (last order card + Reorder) → **What's New**
(product carousel) → **Best Sellers** (product carousel on navy band) → brand footer.
Latest iteration (`4647:120444`) adds a teal **Nearby mosque delivery** banner (`4647:134415`) under the
info strip, opening the mosque picker, and **Upcoming Repeat Delivery** (`4647:121208`: "2/4 Order Picked
Up", slot, COD chip, total + Pay Now) above Easy Reorder.
Variants: Card Floating (`3874:71595`), Notification count (`3874:71761`), Optional Sections (`3874:71846`).
Bottom nav: **Home · Products · [Cart FAB] · Favourite · Profile**.

### notifications
- List (`3876:75495`, `3876:75508`, `3876:75577`, `3876:75650`): order confirmed / on the way / delivered, relative time ("2h"), grouped by day.
- Empty / onboarding-style state (`3876:75730`).

### catalog
- Product listing (`3876:76847`; filtered `3876:77003` shows "10 Products found" and a count badge on Filter): "explore Products" header, category tabs (All, Glass, Sparkling, Natural, Alkaline, Kiddies, Other — Tissues, Cups), grid of Product Cards.
- Filter sheet: Sizes (250 / 330 / 500 / 750 ML …), Category, Brand, Price; "Apply".
- Search: recent searches (`4116:51213`), suggestions, results with "12 Results Found" (`5259:97449`).
- Subscribe & Save promo tile in the product grid (`4128:106498`): "Get 20% OFF on recurring water bottle deliveries — Daily • Weekly • Monthly", Subscribe Now.
- Product detail (`4128:106404`, `4128:106678`, `4317:135245`, `4317:135679`, `4128:107517`): pack sizes (e.g. 750 ML × 4 / × 12), quantity stepper, price + struck price, add-ons ("View All"), sticky "View Cart". (The Subscribe & Save tile visible in these frames sits in the product grid behind the sheet.)

### addresses
- Map + current location marker, "Order will be delivered here".
- Saved addresses (logged-in), "Login to use your saved addresses" (guest), suggestions list.
- Add / Edit address: label chips (Home, Work, Family, Office, Kids School, Other), fields, "Complete your Address".
- Photo auto-fill: "Add a photo to auto-fill your address" → Capture / Upload from Gallery.
- Errors: "This location is outside our delivery area" (inline), "No Location" empty state.
- Delete confirmation.
- Nearby mosque delivery (`4906:80755`): map with mosque markers, swipeable "Order will be delivered here" mosque cards, Confirm Location → product listing with the mosque card and an edit button (`4906:80971`, card `4906:81448`) → checkout delivering to the mosque: mosque glyph, no type tag, CHANGE back to the mosque picker (`5320:72294`, card `5320:72332`). The mosque is sent as an address of type `mosque`; picking any saved address ends it.

### favourites
- List with category tabs; heart toggle on Product Card.
- "Remove … from Favourites?" confirmation; "No Favourites" empty state.

### cart
- My Cart (n): line items with quantity stepper, add-ons, coupon entry ("Apply Coupons"), order summary (Item Total, Discount, Delivery fee, VAT, Total (Tax Included)).
- Minimum-order nudge: "Add QAR 6 more to reach minimum order" / "Shop QAR 6 more to unlock".
- Empty cart illustration.
- Checkout gate → `auth` if not logged in.

### auth
- Enter Mobile Number (+974 default; +971 seen as alternative), "Login with a valid local Mobile Number", "Or Login With".
- Verify Mobile Number: 4-digit OTP, 00:59 countdown, Resend, "Incorrect OTP".
- "Incorrect Number" inline error.
- Fill Your Details (name, email).

### checkout
- Delivery address card (edit), delivery mode toggle **Deliver / Repeat Order**.
- Delivery date & time: Today / Tomorrow / Choose Another Date (calendar), slots (08:00 AM–12:00 PM, 02:00 PM–06:00 PM).
- Set Up Repeat Order: Frequency (Weekly, Every 2 Week, Monthly), Start Date, Delivery Day & Time, Number of Deliveries / Until I Cancel.
- Special instructions (optional).
- Payment method: Cash to driver, Card (saved cards, add new card), QPay debit card.
- Bill summary (prices inclusive of taxes), To Pay, Checkout.
- Order Placed: "Thank you for your purchase!", order number.

### profile / payments / rewards / support
- Profile hub (`4198:44341`): points card (2,530 points worth QAR 112.50, expiring points), My Orders, Saved Address, Saved Cards, Rewards & Offers, Change language (Eng/عربي), WhatsApp Support, About Us, Terms & Policies, Logout, Delete Account.
- My Profile: name, email (verify via OTP), mobile (change → OTP; "This number already exist" error).
- My Cards: list, Add/Edit card, delete confirmation, "No Saved cards" empty state.
- Available Coupons + coupon rules; How to Earn & Redeem.
- Static policy pages (Last Updated date, sectioned content).

## 3. Business rules visible in the design (confirm with backend — `TODO(backend)`)

| Rule | Seen as |
|---|---|
| Currency is QAR, 2 decimals | "QAR 96.00" (note: Easy Reorder shows "19.00 QAR" — inconsistent, ask design) |
| Minimum order value | "Minimum Order QAR 150"; cart nudge "Add QAR 6 more" |
| Delivery fee / VAT / discount lines | Order summary |
| Delivery slots are fixed windows | 08:00–12:00, 14:00–18:00 |
| Repeat orders | Weekly / Every 2 weeks / Monthly; N deliveries or until cancelled |
| Subscribe & Save discount | "Get 20% OFF on recurring … deliveries" |
| OTP length & resend timer | 4 digits, 60 s |
| Delivery area restriction | "outside our delivery area" |
| Loyalty points | balance, QAR value, expiry |

Pure-logic rules above (cart totals, min-order delta, slot availability, repeat schedule, points value,
OTP timer) live in **domain** use cases / `core/utils` and are built **test-first** (`08_TESTING.md`).
