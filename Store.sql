PGDMP     "                    {            Store    14.6    15.2 7    3           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            4           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            5           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            6           1262    33612    Store    DATABASE     i   CREATE DATABASE "Store" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';
    DROP DATABASE "Store";
                postgres    false                        2615    2200    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                postgres    false            7           0    0    SCHEMA public    ACL     Q   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;
                   postgres    false    4            �            1259    33614    category    TABLE     [   CREATE TABLE public.category (
    id integer NOT NULL,
    name character varying(255)
);
    DROP TABLE public.category;
       public         heap    postgres    false    4            �            1259    33613    category_id_seq    SEQUENCE     �   CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.category_id_seq;
       public          postgres    false    4    210            8           0    0    category_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;
          public          postgres    false    209            �            1259    33621    image    TABLE     ~   CREATE TABLE public.image (
    id integer NOT NULL,
    file_name character varying(255),
    product_id integer NOT NULL
);
    DROP TABLE public.image;
       public         heap    postgres    false    4            �            1259    33620    image_id_seq    SEQUENCE     �   CREATE SEQUENCE public.image_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.image_id_seq;
       public          postgres    false    212    4            9           0    0    image_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.image_id_seq OWNED BY public.image.id;
          public          postgres    false    211            �            1259    33676    orders    TABLE       CREATE TABLE public.orders (
    id integer NOT NULL,
    count integer NOT NULL,
    date_time timestamp(6) without time zone,
    number character varying(255),
    price real NOT NULL,
    status smallint,
    person_id integer NOT NULL,
    product_id integer NOT NULL
);
    DROP TABLE public.orders;
       public         heap    postgres    false    4            �            1259    33675    orders_id_seq    SEQUENCE     �   CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.orders_id_seq;
       public          postgres    false    220    4            :           0    0    orders_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;
          public          postgres    false    219            �            1259    33628    person    TABLE     �   CREATE TABLE public.person (
    id integer NOT NULL,
    login character varying(100),
    password character varying(255),
    role character varying(255)
);
    DROP TABLE public.person;
       public         heap    postgres    false    4            �            1259    33627    person_id_seq    SEQUENCE     �   CREATE SEQUENCE public.person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.person_id_seq;
       public          postgres    false    214    4            ;           0    0    person_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.person_id_seq OWNED BY public.person.id;
          public          postgres    false    213            �            1259    33637    product    TABLE     �  CREATE TABLE public.product (
    id integer NOT NULL,
    date_time timestamp(6) without time zone,
    description text NOT NULL,
    price real NOT NULL,
    seller character varying(255) NOT NULL,
    title text NOT NULL,
    warehouse character varying(255) NOT NULL,
    category_id integer NOT NULL,
    CONSTRAINT product_price_check CHECK ((price >= (1)::double precision))
);
    DROP TABLE public.product;
       public         heap    postgres    false    4            �            1259    33659    product_cart    TABLE     m   CREATE TABLE public.product_cart (
    id integer NOT NULL,
    person_id integer,
    product_id integer
);
     DROP TABLE public.product_cart;
       public         heap    postgres    false    4            �            1259    33658    product_cart_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.product_cart_id_seq;
       public          postgres    false    218    4            <           0    0    product_cart_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.product_cart_id_seq OWNED BY public.product_cart.id;
          public          postgres    false    217            �            1259    33636    product_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.product_id_seq;
       public          postgres    false    4    216            =           0    0    product_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;
          public          postgres    false    215                       2604    33617    category id    DEFAULT     j   ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);
 :   ALTER TABLE public.category ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    210    210            �           2604    33624    image id    DEFAULT     d   ALTER TABLE ONLY public.image ALTER COLUMN id SET DEFAULT nextval('public.image_id_seq'::regclass);
 7   ALTER TABLE public.image ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    212    212            �           2604    33679 	   orders id    DEFAULT     f   ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);
 8   ALTER TABLE public.orders ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    219    220            �           2604    33631 	   person id    DEFAULT     f   ALTER TABLE ONLY public.person ALTER COLUMN id SET DEFAULT nextval('public.person_id_seq'::regclass);
 8   ALTER TABLE public.person ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    213    214    214            �           2604    33640 
   product id    DEFAULT     h   ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);
 9   ALTER TABLE public.product ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    216    216            �           2604    33662    product_cart id    DEFAULT     r   ALTER TABLE ONLY public.product_cart ALTER COLUMN id SET DEFAULT nextval('public.product_cart_id_seq'::regclass);
 >   ALTER TABLE public.product_cart ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    218    218            &          0    33614    category 
   TABLE DATA                 public          postgres    false    210   X;       (          0    33621    image 
   TABLE DATA                 public          postgres    false    212   �;       0          0    33676    orders 
   TABLE DATA                 public          postgres    false    220   �A       *          0    33628    person 
   TABLE DATA                 public          postgres    false    214   C       ,          0    33637    product 
   TABLE DATA                 public          postgres    false    216   D       .          0    33659    product_cart 
   TABLE DATA                 public          postgres    false    218   �T       >           0    0    category_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.category_id_seq', 3, true);
          public          postgres    false    209            ?           0    0    image_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.image_id_seq', 105, true);
          public          postgres    false    211            @           0    0    orders_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.orders_id_seq', 4, true);
          public          postgres    false    219            A           0    0    person_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.person_id_seq', 2, true);
          public          postgres    false    213            B           0    0    product_cart_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.product_cart_id_seq', 23, true);
          public          postgres    false    217            C           0    0    product_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.product_id_seq', 21, true);
          public          postgres    false    215            �           2606    33619    category category_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.category DROP CONSTRAINT category_pkey;
       public            postgres    false    210            �           2606    33626    image image_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.image DROP CONSTRAINT image_pkey;
       public            postgres    false    212            �           2606    33681    orders orders_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public            postgres    false    220            �           2606    33635    person person_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.person DROP CONSTRAINT person_pkey;
       public            postgres    false    214            �           2606    33664    product_cart product_cart_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT product_cart_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.product_cart DROP CONSTRAINT product_cart_pkey;
       public            postgres    false    218            �           2606    33645    product product_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.product DROP CONSTRAINT product_pkey;
       public            postgres    false    216            �           2606    33647 $   product uk_qka6vxqdy1dprtqnx9trdd47c 
   CONSTRAINT     `   ALTER TABLE ONLY public.product
    ADD CONSTRAINT uk_qka6vxqdy1dprtqnx9trdd47c UNIQUE (title);
 N   ALTER TABLE ONLY public.product DROP CONSTRAINT uk_qka6vxqdy1dprtqnx9trdd47c;
       public            postgres    false    216            �           2606    33682 "   orders fk1b0m4muwx1t377w9if3w6wwqn    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk1b0m4muwx1t377w9if3w6wwqn FOREIGN KEY (person_id) REFERENCES public.person(id);
 L   ALTER TABLE ONLY public.orders DROP CONSTRAINT fk1b0m4muwx1t377w9if3w6wwqn;
       public          postgres    false    220    3467    214            �           2606    33653 #   product fk1mtsbur82frn64de7balymq9s    FK CONSTRAINT     �   ALTER TABLE ONLY public.product
    ADD CONSTRAINT fk1mtsbur82frn64de7balymq9s FOREIGN KEY (category_id) REFERENCES public.category(id);
 M   ALTER TABLE ONLY public.product DROP CONSTRAINT fk1mtsbur82frn64de7balymq9s;
       public          postgres    false    3463    216    210            �           2606    33687 "   orders fk787ibr3guwp6xobrpbofnv7le    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk787ibr3guwp6xobrpbofnv7le FOREIGN KEY (product_id) REFERENCES public.product(id);
 L   ALTER TABLE ONLY public.orders DROP CONSTRAINT fk787ibr3guwp6xobrpbofnv7le;
       public          postgres    false    3469    220    216            �           2606    33648 !   image fkgpextbyee3uk9u6o2381m7ft1    FK CONSTRAINT     �   ALTER TABLE ONLY public.image
    ADD CONSTRAINT fkgpextbyee3uk9u6o2381m7ft1 FOREIGN KEY (product_id) REFERENCES public.product(id);
 K   ALTER TABLE ONLY public.image DROP CONSTRAINT fkgpextbyee3uk9u6o2381m7ft1;
       public          postgres    false    216    3469    212            �           2606    33670 (   product_cart fkhpnrxdy3jhujameyod08ilvvw    FK CONSTRAINT     �   ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fkhpnrxdy3jhujameyod08ilvvw FOREIGN KEY (product_id) REFERENCES public.product(id);
 R   ALTER TABLE ONLY public.product_cart DROP CONSTRAINT fkhpnrxdy3jhujameyod08ilvvw;
       public          postgres    false    218    3469    216            �           2606    33665 (   product_cart fksgnkc1ko2i1o9yr2p63ysq3rn    FK CONSTRAINT     �   ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fksgnkc1ko2i1o9yr2p63ysq3rn FOREIGN KEY (person_id) REFERENCES public.person(id);
 R   ALTER TABLE ONLY public.product_cart DROP CONSTRAINT fksgnkc1ko2i1o9yr2p63ysq3rn;
       public          postgres    false    218    3467    214            &   ~   x���v
Q���W((M��L�KN,IM�/�T��L�Q�K�M�Ts�	uV�0�QP�0����x��uMk.OҌ01�bÅd`2`��\�waӅ�.6]�z���^���.l ��� �@T�      (   �  x���͊e7���wg:���W^x�`<0���d��M����O�x�S{]
.Em�$}q?���������ǟ������j/�������u~|��o�?��������ٟ���o���}���k�_�fn5+�V�j��(�<�Qk�l_���/��W��o?|:�l�� ͍d�J9�NZ���j/s��^4�#�!Y���,Qj,��0u�Jٛ�:�Xc���IH�)�x2J%%��
�l�zO�mq6���,� ���28G���iԒH��u1��_�$��'��c�@g�?�a9��Z��e��ْ�57?�W��@��!<&����RC�:�o�<As4��i!Q�)Ki�W��[�D,���M��T��@#6�#�=��"�ֲhz#�\�������<)��[+Ī"�ڸz�&����k���p�i�f��t��)���t�����0��P^!��1(��0�+���sʹgE�HɸQ޾׺Q��(�Uk�m�c�\3C3L��ͨ��s�gv?. �V�:�,C��V�5�Q�iL�����T�7C���6��"��k��*9���֛�c𧻓��֔a����$y1yq�|�C7C�ۇVi�3���RI�X-V�$ܲ�n��4��ūa�)z��g��9����w�:�lۇ8�������H-e�<-��&{�:׼|H=��g���p��Y������c��CXY-$sZ�a�f�;@��B0�Om���k^>��#�x�٠ilұ0�k[�:��>�Ǆ��%ܭ����NK��4T��:��>$xOm+%*��q⁽I�Cc����o��5���a�8�}2Ή��a�4K�����P=�l��O���"�C�yh O�G֞Ø7C�ۇ�D��D*�!F�F�E(
YK�Nn��5���D3Б )��p���a���.;��ۇJu������$>�R�0�0a�f�\s3T�M]�i��s�T��]�;w��7C�Xs3���J�猻�d$@�v��Zr�:���T�)�Q�f��$�/3����|3t���V{B���m�sf'���"����,7Cǚ#\��yT��%���ꊔ�4�b�F�v3t���|z,��C���̝��P��#h�Zn�Ʊ��e33G����.x�#�`�x��k�]�Mȷh	�Z@N�I3T$s�:��W��(��%�й��$�Y3�������o��5�.k8eUXP��'��${��^� ��t3t�y��'�Jܵ��|�%B�0��o��Xs���	[�Pvv��Vw})��>��o=As�P������֙-B��'�W�y�7���yu{}VLf�6�g�����=���9�:ׄ�����Bf��C9����A���D/o=Ct;�e�. ��>�~X�e/����M�����M�͝s�J��G5��eZ�1z�����uM[3�u�I�!R3+������A�E/3�2�2��������/#*9��'�^�:c}T�]��_4�N���O�9�|��.���O�B      0     x���=k1���
oI���s:u�()4i���4��>�}���СK@�_#��+k8�^Nl8=�n�ߛ�i�������Yh���Y�c:��%qv�.u�9��&9�~��"KI{=�5]��)��fo�O��#[Iΐ��I� �Pm�l���I�
t9
M^jޑ�.xr%� ����Z?,��a�ۛ��?�M �������&iE�h_�d��b�{���sG���n�m tep�PWD>$/�%'�úL����h"@p��Y����ͿI�3A���;德Gb�_,> wr�;      *   �   x���AO�0 �;������5*��\�(H���bjǠ����M��������%��Ä��`�Ɂ�[)nLe{��D|��Z*��m��궚�m�f)��NRycp�¹{�����Y�
�§x7�\-ə�2��y��ЈD.P�,z���|��EI��7}p�`��7���`��������t_�v1,V]��4��c&����i���.̅�����su9��Q]4      ,      x��Z[o�~7��0�Kl����H"�$;�#Ė�n�V��e��}�Ȓ#Ǭ��[��H�"��"��m�,�BI��Ι��%��r�!�Z�Μ9��|��,.][X�n��_5w�޹�vs����������ڭ������������q��͍���k�wr����Mzvo���Ս��\ۼM~�������=�x�^|w}��o��:g�0���5s�+��+�|�8�/OyS(V��j�4=��{��W����vD}��n�ȏ�QwX����6�;QHÃ�c���imsżzcٛ�_3��L4���1�E��g�#��(�G��!vM���M���-A��.٣G;&jҸ>2���<G4�1}� ##�Io���xd8�A��
�iW^�����̿�x}��nӛ3�S�5z=!L���[���&O�	�jc�g����h=�������/k��Q×���t�\,g!�X�X���b7���!-��L�~̥+��J���5�����f����^�j���f��uq6�xBt���
[��_��|�>l��mB�!�>�F�>�Ŝ4GW�?E��	�ߜ&Ñ$'�Ȁ����xZ&b���d���|CːC���m�C��J�i�����Gֶ:��ݐu6|,��c�0�dϰ.u<��q�W��oi�o����٦�,�� 
10�Kz�'>�#W�>�n�Cݥ�l�C��M�"j�����d�"`�W[�`���L���3p�����l(�r�om�n�<k6��d>���G�L��J�X����RaN�̛9�~�X���!�؍����zicu��u�\_g��uؖ�T#s��� X�`�UC�/6b��y��5�/�˳Y}6��Fk�.<� T	��1�x�澩����ω�%��C���F�x�<�.Μ/ܷ(������<c�*b��� US(��G9��.��p�3j�R%\�yC�ͩ�>B�� �Ya��чJ����J:��6�u�<B�����|n�L�b��W����l�d3���
X�D��bW,Y�E���j�WB0�B"�&3��ȜRY>�3^y���G�5$ap�����r�^!^�(H�x�M����9�ձ/˪�2�LĞ��_:�ҙ�[�l���L�&��>�y
[�H��0)�X�0�F*OE;��}Q@ 
ZѦ��z��wъI \[!����&����y��E^~�D�>@Hbd9� �٬A�����*}@�uW��T�+�x1&)��JA(����j0�f�kr�����G4�gmIfc�d|{��A�kFmG��u�8{q
$m��M�SXm�����$B �Cݓ�vX$�>�?R��u����-^���O�e���&r�c'�>�����(�ps�B)�>���sp)�Fh%J�>{;��G�B��%1�)����Ǿ���R[	`��΄���E�1��d���m�_N����	g�f�-IAJpb�ڸM[�g'ݗ0S����~�����|M"��y�O_2;JoP�E��Q��H��ʦ"��K�W�^_���$�y9�pzx$��$	�X���b/e^Ό�h4��GJ��Q¨'�Lu&��/ϓ�#�F�P�
�řb�<s���oo�'
�k��x� H�@iԖ����2�՚~�ug�K����:KBF�K9���X���vdM�%���5�ҋ�e��}Y�1������7�B����	<I@���FIG9���;B�_H��N(��&�.���,�(�9���/�Dy��;��G6�(�Q���=)/��eFAd)��hͷmQ�%퉊hi���`H�s��G��vɋ�,Ceo}ݟ���Ī��M��p��%�lY�����5�E����؜�A2z�S2�4�+��)�	��8�(��(��^8�l��;죚�<��8�Y�6�	i�J�[jFA��@���x��g�S�z��d�F�3���2������$���P�����4���$BPv[�QG(̎���0��:β��%� `��������.c��"���s:��c���f�;n^�FF[?NRġ�l�$�Di�`/� �`ky��˄��T�����=ͼMa�����X�#�dg��e�&B�`�<*ghC�X�U�F�ԡ�I	I�A͇�QV�CM�Ցv�4<�Tb}��<2	7f��,e����ˋ�DFa����e�	�*��q*M�~�4ZM��jaf�2�/�ʐ�yj��8x����7�_FVE{��9@��xn�za4U�֒D��]"��AeS���z�$֏9Sk�NzI�'i�ī�ſl*�Ǆ��:�t� �A61��n"�3#D	���D^2�A*�e��fs>��↌bZr��F�[-t��C��H�0
�H��ָ���L�e������ס���ʉ##L��B!��"w�(�F�d�Q*�=�� ���d�G�)�R�k�'�a.���`S_(��H=�5X�Q����E<K��.�ކ���1���]Mڼ=�!6�AM�	Y��ꈶ5D��g���)b�hs��Р3�q��KJ>>�8�>e�?�Ɂ�l���6��v���5�ԫ��G�'���K��@nD�R�J��S''麚*<N�J�bKo����ˮ;Џ������)�Ե���Oy4�%�*C��"��|��,C�:F�+%�S���LeFe����,N��{6�)��yz��nq.73ܝ-�ft�����(�hU+�d(qTY?��HW�z	�Ƅ�x¯�T�:���/��eS�F@��4���8��X��!��;7�!�M)�܃�%��dTE0���X\H�V�`8�8fG96)�?>ˍo�- I�/��tB�J�a�v�]����2�V�c�:�P�>霧�)�uE�S�h�->��C�X�0.������S�'z�D��Hc�4QT*����]Ѭ"�R��#��ªYh�2e����V��1�JW�����LL�A�H{�P\���dN��r��
!��e�7߈?� �^���R�流q�AÜ2�/ݒI�����I� o*�S�N��-1�}5Y��'2���X��?���7枤_=5A�Ub�#J
߮R'�����P4f��ud;�3~��_#-A}�M����By0��/3�[r�9��<�:7=��ϴ�G�E� tM$�� s���X~(�Kb�r���=���8�;��g�rI9z.�?I�J<�5��C/��o������1�ZK�lE�t���S,|1
39ٛs˼"%�j9_�f�=�<S*@�O��q���6��V�f�T�ua�������S�b�+��;9�S������'�iQ�ãIb�N���+}��E:�ܺvA�S[P�mO����!�=٩ⵧN\��r~W�w�i�S�c��)O�W�$�'�-�U1${I�r�N�K�ި�:����rE�-�Ȱ�_�C&�T1?"�"Q��o�ԔG�%�X<�f�ɢ�J|�J�m�,l����۫�y���HC�!�䮡�E�����Y$�d�C�u��|�c�Dp�h���?Q�a׆���H����ݫ��2��c��QP��%r�Z�s. i;>��#��� ���d:�g����]ڤ�nè}���f��C���G
/Z��D����dI>�G�z�8IrrY`l	'�t�����섓�O�A�ٶ������wh�)���A0ַ�t�DP��#m�z���:�j�^U;>g�9�yx�굋��|@�۹hXɤ�B�T�T6W��xұ�Dx�\V�����N�ͼ��rۼ���ꝵ���*߿,ۤwl�A�q:����|�+��-7N�_\������Reڛ)W
���p�o��+<�T���w6W�6��A-?�Fn�Z��k�~�R����:�E�Tm�Y���v��m�a�W}�����qA�YH�S�|�Y5�m�=�	�\Ѳ���6H�G��Ȩ�mt�yV�1��񵴸0b�UͶ�˥va�ח�}��Q{��gȶi^�	�h'w��1�O����9���1�r��go�ha���k_�a`|$���1�a6��� �   �\��P7(&9��z�R.!]<�����g���J#Z��s�l!Ν��	��)��ֈ;[z@Ju�<Ģ�����ٰt����G�H$^��S�m4�ǜp�
�區W�T�{�T8��M������:-���Ɗ����R
0.�/�a��}���/��[34s�$-�W����xeay�g]nR�8s�qQ��      .   
   x���         