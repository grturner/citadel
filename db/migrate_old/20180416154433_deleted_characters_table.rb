class DeletedCharactersTable < ActiveRecord::Migration[5.1]
  def up
    query = <<-SQL
      CREATE TABLE deleted_characters (
        character_oid         bigint(20)      NOT NULL,
        account_id            mediumint(8)    unsigned NOT NULL,
        galaxy_id             int(5)          unsigned NOT NULL,
        firstname             varchar(15)     NOT NULL,
        surname               varchar(20),
        race                  tinyint(2)      NOT NULL,
        gender                tinyint(1)      NOT NULL,
        template              tinytext        NOT NULL,
        creation_date         timestamp       NOT NULL,
        PRIMARY KEY (character_oid),
        FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id),
        KEY acc_idx (account_id)
      ) ENGINE=InnoDB DEFAULT CHARSET=latin1;
    SQL
    execute query
  end

  def down
    query = <<-SQL
      DROP TABLE deleted_characters;
    SQL
    execute query
  end
end
