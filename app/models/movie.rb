class Movie < ActiveRecord::Base
    def self.create_with_title(title)
        new_movie = Movie.new(title: title)    
        new_movie.save
        new_movie
    end

    def self.first_movie
        Movie.first
    end

    def self.last_movie
        Movie.last
    end

    def self.movie_count
        Movie.count
    end

    def self.find_movie_with_id(id)
        Movie.find(id)
    end

    def self.find_movie_with_attributes(attributes)
        Movie.find_by attributes
    end

    def self.find_movies_after_2002
        Movie.where("release_date > 2002")
    end

    def update_with_attributes(updates)
        # updates.each do |key, value|
        #     self[key] = value if self.attributes.has_key?(key.to_s)
        # end

        # self.save

        self.update(updates)
    end

    # def self.update_all_by_attributes(updates)
    #     update_clause = ""

    #     updates.each do |key, value|
    #         value.class == String ? formatted_value = "'#{value}'" : formatted_value = value
    #         update_clause == "" ? update_clause += "#{key} = #{formatted_value}" : update_clause += ", #{key} = #{formatted_value}"
    #     end 

    #     Movie.update_all update_clause
    # end

    def self.update_all_titles(new_title)
        Movie.update_all "title = '#{new_title}'"
    end

    def self.delete_by_id(id)
        Movie.destroy_by(id: id)
    end

    def self.delete_all_movies
        Movie.destroy_all
    end
end