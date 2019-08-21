Sequel.migration do
  no_transaction
  change do
    alter_table(:notifications) do
      add_index :user_id, name: "notifications_user_id_null_read_at", where: {read_at: nil}, concurrently: true
    end
  end
end
