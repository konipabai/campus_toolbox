import { Entity, Column, PrimaryGeneratedColumn } from "typeorm"

@Entity()
export class resultLostFound {
    @PrimaryGeneratedColumn()
    id: number;

    @Column({ type: 'varchar', length: 255, nullable: false })
    account: string;             // 账号

    @Column({ type: 'varchar', length: 255, nullable: false })
    name: string;                // 用户名

    @Column({ type: 'varchar', length: 255, nullable: false })
    state: string;               // 寻/拾

    @Column({ type: 'varchar', length: 255, nullable: false })
    item: string;                // 物品

    @Column({ type: 'varchar', length: 255, nullable: false })
    brand: string;               // 品牌

    @Column({ type: 'varchar', length: 255, nullable: false })
    location: string;            // 地点

    @Column({ type: 'varchar', length: 255, nullable: false })
    description: string;         // 描述

    @Column({ type: 'varchar', length: 255, nullable: false })
    contact: string;             // 联系方式
}