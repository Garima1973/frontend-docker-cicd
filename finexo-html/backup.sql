PGDMP  &    0                }            Keyhole "   12.22 (Ubuntu 12.22-2.pgdg22.04+1)    17.2     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    16412    Keyhole    DATABASE     q   CREATE DATABASE "Keyhole" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C.UTF-8';
    DROP DATABASE "Keyhole";
                     postgres    false                        2615    2200    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                     postgres    false            �           0    0    SCHEMA public    ACL     Q   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;
                        postgres    false    6            �            1259    16426    orders    TABLE     �   CREATE TABLE public.orders (
    id integer NOT NULL,
    user_id integer,
    order_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    total_amount numeric(10,2) NOT NULL
);
    DROP TABLE public.orders;
       public         heap r       postgres    false    6            �            1259    16424    orders_id_seq    SEQUENCE     �   CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.orders_id_seq;
       public               postgres    false    205    6            �           0    0    orders_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;
          public               postgres    false    204            �            1259    16415    users    TABLE     �   CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.users;
       public         heap r       postgres    false    6            �            1259    16413    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public               postgres    false    203    6            �           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public               postgres    false    202                       2604    16429 	   orders id    DEFAULT     f   ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);
 8   ALTER TABLE public.orders ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    205    204    205                       2604    16418    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    203    202    203            �          0    16426    orders 
   TABLE DATA           G   COPY public.orders (id, user_id, order_date, total_amount) FROM stdin;
    public               postgres    false    205   �       �          0    16415    users 
   TABLE DATA           <   COPY public.users (id, name, email, created_at) FROM stdin;
    public               postgres    false    203   (       �           0    0    orders_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.orders_id_seq', 2, true);
          public               postgres    false    204            �           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 2, true);
          public               postgres    false    202                       2606    16432    orders orders_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public                 postgres    false    205                       2606    16423    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public                 postgres    false    203                       2606    16421    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public                 postgres    false    203                       2606    16433    orders orders_user_id_fkey    FK CONSTRAINT     y   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);
 D   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_user_id_fkey;
       public               postgres    false    2844    203    205            �   =   x�u��� �7T�d��b-�_G*Ⱦ7-�����������	8�?�U�R~��?4��      �   _   x�3�t��LNU����+���L�R+srR���s9��Lu�u�L,�ͬ���,,LL��8���s3K28��k�4007����� U      