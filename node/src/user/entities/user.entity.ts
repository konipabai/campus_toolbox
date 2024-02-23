import { Entity, Column, PrimaryGeneratedColumn } from "typeorm"

@Entity()
export class resultUser {
    @PrimaryGeneratedColumn()
    id: number;

    @Column({ type: 'varchar', length: 255, nullable: false })
    account: string;             // 账号

    @Column({ type: 'varchar', length: 255, nullable: false })
    name: string;                // 用户名

    @Column({ type: 'varchar', length: 255, nullable: false })
    password: string;            // 密码

    @Column({ type: 'varchar', length: 255, nullable: false })
    class: string;               // 班级

    @Column({ type: 'varchar', length: 255, nullable: false })
    administrator: string;       // 是否是管理员
}